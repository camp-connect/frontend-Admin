import 'dart:convert';

import 'package:admin/DashBoardOptions/Complains.dart';
import 'package:admin/DashBoardOptions/Thanks.dart';
import 'package:flutter/material.dart';
import 'package:admin/ApiModels/GetStudentDetailsForComplain.dart';
import 'package:admin/config.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:motion_toast/motion_toast.dart';

class StudentsDetailsForComplain extends StatefulWidget {
  final Map<String, dynamic> unresolvedComplaint;
  StudentsDetailsForComplain(this.unresolvedComplaint);

  static const TextStyle optionStyle = TextStyle(
    fontSize: 20,
    fontFamily: 'openSans-medium',
    color: Colors.black87,
    fontWeight: FontWeight.w500,
  );

  @override
  State<StudentsDetailsForComplain> createState() =>
      _StudentsDetailsForComplainState();
}

class _StudentsDetailsForComplainState
    extends State<StudentsDetailsForComplain> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          title: Text(
            'Student Details',
            style: TextStyle(color: Colors.black),
          ),
          elevation: 2,
        ),
        body: Container(
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      'https://images.unsplash.com/photo-1566041510394-cf7c8fe21800?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
                  fit: BoxFit.fill),
            ),
            child: SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40.0, vertical: 10),
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.blueGrey.shade200,
                      radius: 80,
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(
                            'https://img.freepik.com/free-vector/boy-with-dental-braces-dental-care-little-boy-portrait-circular-frame_254685-951.jpg?w=740'),
                        radius: 100,
                        backgroundColor: Colors.white54,
                      ), //CircleAvatar
                    ), //CircleAvatar
                    SizedBox(
                      height: 25,
                    ), //SizedBox
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Student Name : ${widget.unresolvedComplaint['Name']}',
                        style: StudentsDetailsForComplain.optionStyle,
                        softWrap: true,
                        maxLines: 2,
                        overflow: TextOverflow.fade,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Room Number : ${widget.unresolvedComplaint['RoomNumber']}',
                        style: StudentsDetailsForComplain.optionStyle,
                        softWrap: true,
                        maxLines: 2,
                        overflow: TextOverflow.fade,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Email Id : ${widget.unresolvedComplaint['EmailId']}',
                        style: StudentsDetailsForComplain.optionStyle,
                        softWrap: true,
                        maxLines: 2,
                        overflow: TextOverflow.fade,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Contact Number : ${widget.unresolvedComplaint['PersonalContactNumber']}',
                        style: StudentsDetailsForComplain.optionStyle,
                        softWrap: true,
                        maxLines: 2,
                        overflow: TextOverflow.fade,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Issue : ${widget.unresolvedComplaint['JustifiedIssue']}',
                        style: StudentsDetailsForComplain.optionStyle,
                        softWrap: true,
                        maxLines: 10,
                        overflow: TextOverflow.fade,
                      ),
                    ),

                    SizedBox(
                      height: 15,
                    ),
                    // ElevatedButton(
                    //     onPressed: () {
                    //       verify();
                    //       setState(() {
                    //         Navigator.push(
                    //           context,
                    //           MaterialPageRoute(
                    //             builder: (context) {
                    //               return Thanks();
                    //             },
                    //           ),
                    //         );
                    //       });
                    //     },
                    //     child: Text('Verified')),
                    Container(
                      height: 50.0,
                      child: RaisedButton(
                        onPressed: () {
                          verify();
                          setState(() {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) {
                                  return Thanks();
                                },
                              ),
                            );
                          });
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(80.0),
                        ),
                        padding: EdgeInsets.all(0.0),
                        child: Ink(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Color(0xff374ABE), Color(0xff64B6FF)],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ),
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          child: Container(
                            constraints: BoxConstraints(
                                maxWidth: 300.0, minHeight: 50.0),
                            alignment: Alignment.center,
                            child: Text(
                              "Verify",
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ) //Column
            ), //Center
      ),
    );
  }

  void verify() async {
    String uri = config.server;
    String path = '/campconnectadminapi/complainApprovedByAdmin.php';
    Map<String, String> headers = {"Access-Control-Allow-Origin": "*"};

    Map<String, String> body = {
      'IssueId': widget.unresolvedComplaint['IssueId'],
      'Resolved': 't'
    };

    try {
      final response =
          await http.post(Uri.http(uri, path), headers: headers, body: body);

      final String str = jsonEncode(await response.body.toString());
      final decodedjson = jsonDecode(str);
      Map<String, dynamic> map = jsonDecode(decodedjson);
      // List list = map as List
      var code = map['error'];
      if (code == 200) {
        MotionToast.success(
          title: Text("Success"),
          description: Text(map['message']),
          width: 300,
        ).show(context);
      } else {
        MotionToast.error(
                title: Text("Error"), description: Text(map['message']))
            .show(context);
      }

      print(map['error']);
      print(response.body.toString());
    } catch (err) {
      print(err.toString());
    }
  }
}
