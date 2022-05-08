import 'dart:convert';
import 'package:admin/DashBoardOptions/SubDashBoardOptions/StudentDetailsForOutStrength.dart';
import 'package:admin/DashBoardOptions/SubDashBoardOptions/StudentsDetailsForComplain.dart';
import 'package:admin/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:admin/config.dart';
import 'package:http/http.dart' as http;

import '../ApiModels/GetStudentDetailsForOutStrength.dart';

void main() => runApp(OutStrength());

class OutStrength extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

//Creating a class user to store the data;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
//Applying get request.

  bool loading = false;
  Future<List<dynamic>> getRequest() async {
    List<Map<String, dynamic>> list = [];
    List<OutStudentDetail> list1 = [];

    loading = true;
    String url =
        'http://' + config.server + '/campconnectadminapi/outStrength.php';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var temp = getStudentDetailsForOutStrengthFromJson(response.body);
      print(temp);
      for (var i in temp.outStudentDetails) {
        list.add(i.toJson());
        list1.add(OutStudentDetail.fromJson(i.toJson()));
      }
      print(list[0]["Name"]);
      print(list1[0].name);
    }
    loading = false;
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'OutStrength',
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
              if (snapshot.data == null) {
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
                      subtitle: Text(snapshot.data[index]['EmailId']),
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
                              return StudentsDetailsForOutStrength(
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
}
