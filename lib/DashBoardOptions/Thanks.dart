import 'package:admin/DashBoardOptions/OutPassRequest.dart';
import 'package:flutter/material.dart';

import '../dashboard.dart';

class Thanks extends StatelessWidget {
  static const TextStyle optionStyle = TextStyle(
    fontSize: 20,
    fontFamily: 'openSans-medium',
    color: Colors.black87,
    fontWeight: FontWeight.w500,
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Card(
            elevation: 50,
            shadowColor: Colors.black,
            color: Colors.blueGrey.shade100,
            child: SizedBox(
              width: 330,
              height: 250,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 25,
                    ), //SizedBox
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Thanks For Confirming : ',
                        style: optionStyle, //Textstyle
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Soon Student Will able To see it',
                        style: optionStyle, //Textstyle
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return DashBoard();
                              },
                            ),
                          );
                          // Navigator.of(context)
                          //     .popUntil((route) => route.isFirst);
                        },
                        child: Text('Back To DashBoard'))
                  ],
                ), //Column
              ), //Padding
            ), //SizedBox
          ), //Card
        ), //Center
      ),
    );
    ;
  }
}
