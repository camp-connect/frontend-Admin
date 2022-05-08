import 'package:admin/ApiModels/GetStudentDetailsForOutpass.dart';
import 'package:admin/DashBoardOptions/SubDashBoardOptions/StudentDetailsForOutPass.dart';
import 'package:admin/config.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../dashboard.dart';

void main() => runApp(OutPassRequests());

class OutPassRequests extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool loading = false;

  Future<List<dynamic>> getRequest() async {
    List<Map<String, dynamic>> list = [];
    List<UnapprovedOutPass> list1 = [];

    loading = true;
    String url = 'http://' +
        config.server +
        '/campconnectadminapi/listOfUnapprovedOutpass.php';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var temp = getStudentDetailsForOutpassFromJson(response.body);
      for (var i in temp.unapprovedOutPass) {
        list.add(i.toJson());
        list1.add(UnapprovedOutPass.fromJson(i.toJson()));
      }
      print(list[0]["OutDate"].runtimeType);
      print(list1[0].name);
    }
    print(list);
    loading = false;
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Out Pass Requests ',
            style: TextStyle(color: Colors.black),
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return DashBoard();
                },
              ),
            ),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: Container(
          padding: EdgeInsets.all(16.0),
          child: FutureBuilder(
            future: getRequest(),
            builder: (BuildContext ctx, AsyncSnapshot snapshot) {
              if (loading) {
                return Container(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              } else {
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (ctx, index) => Card(
                    elevation: 10,
                    child: ListTile(
                      title: Text(snapshot.data[index]['Name']),
                      subtitle: Text(snapshot.data[index]['Purpose']),
                      leading: CircleAvatar(
                          backgroundImage: NetworkImage(
                              "https://images.unsplash.com/photo-1547721064-da6cfb341d50")),
                      contentPadding: EdgeInsets.all(10.0),
                      trailing: Icon(Icons.arrow_forward),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return StudentsDetailsForOutPass(
                                  snapshot.data[index]);
                            },
                          ),
                        );
                      },
                    ),
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }

  Future<void> delay() async {
    await Future.delayed(const Duration(seconds: 2), () {});
  }
}
