import 'dart:convert';

import 'package:admin/DashBoardOptions/Thanks.dart';
import 'package:admin/dashboard.dart';
import 'package:admin/sessionManager.dart';
import 'package:flutter/material.dart';
import 'package:admin/config.dart';
import 'package:http/http.dart' as http;
import 'package:motion_toast/motion_toast.dart';
import 'package:intl/intl.dart';

DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm:ss");

class NoticeToStudents extends StatefulWidget {
  const NoticeToStudents({Key? key}) : super(key: key);

  @override
  State<NoticeToStudents> createState() => _NoticeToStudentsState();
}

class _NoticeToStudentsState extends State<NoticeToStudents> {
  TextEditingController _adminEmailIdTEC = TextEditingController();
  TextEditingController _studentEmailIdTEC = TextEditingController();
  TextEditingController _issuedDateTimeTEC = TextEditingController();
  TextEditingController _subjectTEC = TextEditingController();
  TextEditingController _noticeBodyTEC = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              'Notice To Student',
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
            constraints: BoxConstraints.expand(),
            decoration: BoxDecoration(color: Colors.white
                // image: DecorationImage(
                //     image: AssetImage(
                //         'images/empty-pure-white-background_476151-236.webp'),
                //     fit: BoxFit.cover),
                ),
            child: SingleChildScrollView(
              child: Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 15.5, horizontal: 15),
                  child: Column(
                    children: <Widget>[
                      // Text(
                      //   'Enter Email of ',
                      //   style: TextStyle(
                      //       color: Colors.black,
                      //       fontFamily: 'OpenSans-ExtraBold',
                      //       fontSize: 22.2,
                      //       fontStyle: FontStyle.normal),
                      // ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 18),
                        child: TextField(
                          controller: _studentEmailIdTEC,
                          autocorrect: true,
                          maxLines: 5,
                          minLines: 1,
                          decoration: InputDecoration(
                            hintText: 'Enter Educational Email',
                            prefixIcon: Icon(Icons.email),
                            hintStyle: TextStyle(color: Colors.grey),
                            filled: true,
                            fillColor: Colors.white70,
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              borderSide:
                                  BorderSide(color: Colors.black26, width: 2),
                            ),
                            labelText: 'Email',
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              borderSide:
                                  BorderSide(color: Colors.blue, width: 2),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 18),
                        child: TextField(
                          controller: _subjectTEC,
                          autocorrect: true,
                          maxLines: 5,
                          minLines: 1,
                          decoration: InputDecoration(
                            hintText: 'Enter the Subject of Notice',
                            prefixIcon: Icon(Icons.subject),
                            hintStyle: TextStyle(color: Colors.grey),
                            filled: true,
                            fillColor: Colors.white70,
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              borderSide:
                                  BorderSide(color: Colors.black26, width: 2),
                            ),
                            labelText: 'Subject',
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              borderSide:
                                  BorderSide(color: Colors.blue, width: 2),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 18),
                        child: TextField(
                          controller: _noticeBodyTEC,
                          autocorrect: true,
                          maxLines: 5, // <-- SEE HERE
                          minLines: 1, // <-- SEE HERE
                          decoration: InputDecoration(
                            hintText: 'Enter the Body of Notice',
                            prefixIcon: Icon(
                              Icons.import_contacts,
                            ),
                            hintStyle: TextStyle(color: Colors.grey),
                            filled: true,
                            fillColor: Colors.white70,
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              borderSide:
                                  BorderSide(color: Colors.black26, width: 2),
                            ),
                            labelText: 'Body',
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              borderSide:
                                  BorderSide(color: Colors.blue, width: 2),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Container(
                        constraints:
                            BoxConstraints.expand(height: 45.0, width: 150.0),
                        child: ElevatedButton(
                          onPressed: () {
                            noticeToStudent();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return Thanks();
                                },
                              ),
                            );
                          },
                          child: Text('Notify'),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void noticeToStudent() async {
    String uri = config.server;
    String path = '/campconnectadminapi/adminNotice.php';
    Map<String, String> headers = {"Access-Control-Allow-Origin": "*"};
    SessionManager sessionManager = SessionManager();
    var list = await sessionManager.profileDataGet();
    String? email = list?.elementAt(0);
    Map<String, String> body = {
      'AdminEmailId': email.toString(),
      'StudentEmailId': _studentEmailIdTEC.text,
      'IssuedDateTime': "2022-05-02 13:56:56",
      'Subject': _subjectTEC.text,
      'NoticeBody': _noticeBodyTEC.text
    };

    try {
      final response =
          await http.post(Uri.http(uri, path), headers: headers, body: body);

      final String str = jsonEncode(await response.body.toString());
      final decodedjson = jsonDecode(str);
      Map<String, dynamic> map = jsonDecode(decodedjson);
      var code = map['error'];
      if (code == 200) {
        MotionToast.success(
          title: Text("Success"),
          description: Text(map['message']),
          width: 300,
        ).show(context);

        Future.delayed(Duration(milliseconds: 700), () {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) {
            return DashBoard();
          }));
        });
      } else {
        MotionToast.error(
                title: Text("Error"), description: Text(map['message']))
            .show(context);
      }
      // print(map['error']);
      // print(response.body.toString());
    } catch (err) {
      print(err.toString());
    }
  }
}
