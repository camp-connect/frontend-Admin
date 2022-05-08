import 'package:admin/DashBoardOptions/OutStrength.dart';
import 'package:admin/DashBoardOptions/Thanks.dart';
import 'package:admin/dashboard.dart';
import 'package:flutter/material.dart';

class StudentsDetailsForOutStrength extends StatefulWidget {
  final Map<String, dynamic> outStudentDetails;
  StudentsDetailsForOutStrength(this.outStudentDetails);

  static const TextStyle optionStyle = TextStyle(
    fontSize: 20,
    fontFamily: 'openSans-medium',
    color: Colors.black87,
    fontWeight: FontWeight.w500,
  );

  @override
  State<StudentsDetailsForOutStrength> createState() =>
      _StudentsDetailsForOutStrengthState();
}

class _StudentsDetailsForOutStrengthState
    extends State<StudentsDetailsForOutStrength> {
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
                        'Student Name : ${widget.outStudentDetails['Name']}',
                        style: StudentsDetailsForOutStrength.optionStyle,
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
                        'Email Id : ${widget.outStudentDetails['EmailId']}',
                        style: StudentsDetailsForOutStrength.optionStyle,
                        softWrap: true,
                        maxLines: 2,
                        overflow: TextOverflow.fade,
                      ),
                    ),
                    // SizedBox(
                    //   height: 15,
                    // ),
                    // Align(
                    //   alignment: Alignment.topLeft,
                    //   child: Text(
                    //     'Contact Number : ${'9078563412'}',
                    //     style: StudentsDetailsForOutStrength.optionStyle,
                    //     softWrap: true,
                    //     maxLines: 2,
                    //     overflow: TextOverflow.fade,
                    //   ),
                    // ),
                    //
                    // SizedBox(
                    //   height: 15,
                    // ),
                    // Align(
                    //   alignment: Alignment.topLeft,
                    //   child: Text(
                    //     'Parents Number : ${'9078563412'}',
                    //     style: StudentsDetailsForOutStrength.optionStyle,
                    //     softWrap: true,
                    //     maxLines: 2,
                    //     overflow: TextOverflow.fade,
                    //   ),
                    // ),

                    SizedBox(
                      height: 15,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Date : ${widget.outStudentDetails['OutDate']}',
                        style: StudentsDetailsForOutStrength.optionStyle,
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
                        'Out Time : ${widget.outStudentDetails['OutTime']}',
                        style: StudentsDetailsForOutStrength.optionStyle,
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
                        'In Time : ${widget.outStudentDetails['InTime']}',
                        style: StudentsDetailsForOutStrength.optionStyle,
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
                        'Purpose : ${widget.outStudentDetails['Purpose']}',
                        style: StudentsDetailsForOutStrength.optionStyle,
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
                        'Parents Agreed : ${widget.outStudentDetails['ParentsPermission']}',
                        style: StudentsDetailsForOutStrength.optionStyle,
                        softWrap: true,
                        maxLines: 2,
                        overflow: TextOverflow.fade,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    // ElevatedButton(
                    //     onPressed: () {
                    //       Navigator.push(
                    //         context,
                    //         MaterialPageRoute(
                    //           builder: (context) {
                    //             return DashBoard();
                    //           },
                    //         ),
                    //       );
                    //     },
                    //     child: Text('Ok')),
                    Container(
                      height: 50.0,
                      child: RaisedButton(
                        onPressed: () {
                          setState(
                            () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return DashBoard();
                                  },
                                ),
                              );
                            },
                          );
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
                              "Ok",
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
    ;
  }
}
