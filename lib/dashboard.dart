import 'package:admin/DashBoardOptions/RegistrationRequests.dart';
import 'package:admin/login.dart';
import 'package:admin/sessionManager.dart';
import 'package:flutter/material.dart';
import 'DashBoardOptions/NoticeToStudent.dart';
import 'DashBoardOptions/Complains.dart';
import 'DashBoardOptions/OutPassRequest.dart';
import 'DashBoardOptions/OutStrength.dart';

var email;
var name;
var employeeId;
var personalContactNumber;

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  void initState() {
    super.initState();
    getAdminData();
  }

  int _selectedIndex = 0;
  List<Widget> _widgetOptions = <Widget>[Content(), AdminProfile()];

  // static const List<Widget> _widgetOptionsForBottomBar = <Widget>[
  //   Text(
  //     'Index 0: Home',
  //     style: optionStyle,
  //   ),
  //   Text(
  //     'Index 1: Profile',
  //     style: optionStyle,
  //   )
  // ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text('DashBoard', style: TextStyle(color: Colors.black)),
            backgroundColor: Colors.white,
            elevation: 0,
          ),
          body: _widgetOptions.elementAt(_selectedIndex),
          backgroundColor: Colors.white,
          bottomNavigationBar: BottomNavigationBar(
            showUnselectedLabels: false,
            selectedFontSize: 12,
            iconSize: 28,
            currentIndex: _selectedIndex,
            elevation: 10,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
            selectedItemColor: Colors.blue[600],
            onTap: _onItemTapped,
          ),
        ),
      ),
    );
  }

  void getAdminData() async {
    SessionManager sessionManager = SessionManager();
    var list = await sessionManager.profileDataGet();
    email = await list?.elementAt(0);
    name = await list?.elementAt(1);
    employeeId = await list?.elementAt(2);
    personalContactNumber = await list?.elementAt(3);
  }
}

class Content extends StatefulWidget {
  const Content({Key? key}) : super(key: key);

  @override
  State<Content> createState() => _ContentState();
}

class _ContentState extends State<Content> {
  static const TextStyle optionStyle = TextStyle(
    fontSize: 25,
    color: Colors.brown,
    fontWeight: FontWeight.w500,
  );
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/background.jpg"), fit: BoxFit.cover)),
        width: double.infinity,
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                    return OutPassRequests();
                  }));
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  height: 200,
                  // margin: const EdgeInsets.all(15.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                        image: AssetImage('images/outPass.webp'),
                        fit: BoxFit.fill),
                  ),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Out Pass',
                        textAlign: TextAlign.left,
                        style: optionStyle,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return Complains();
                      },
                    ),
                  );
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  height: 200,
                  // margin: const EdgeInsets.all(15.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                        image: AssetImage('images/complains.webp'),
                        fit: BoxFit.fill),
                  ),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Complains',
                          textAlign: TextAlign.left, style: optionStyle),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return OutStrength();
                      },
                    ),
                  );
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  height: 200,
                  // margin: const EdgeInsets.all(15.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                        image: AssetImage('images/outStrength.webp'),
                        fit: BoxFit.fill),
                  ),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Out Strength',
                        textAlign: TextAlign.left,
                        style: optionStyle,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return RegistrationRequests();
                      },
                    ),
                  );
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  height: 200,
                  // margin: const EdgeInsets.all(15.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                        image: AssetImage('images/registrationRequest.webp'),
                        fit: BoxFit.fill),
                  ),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Registration Request',
                        textAlign: TextAlign.left,
                        style: optionStyle,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return NoticeToStudents();
                      },
                    ),
                  );
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  height: 200,
                  // margin: const EdgeInsets.all(15.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                        image: AssetImage('images/notice.webp'),
                        fit: BoxFit.fill),
                  ),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        'Notice',
                        textAlign: TextAlign.left,
                        style: optionStyle,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AdminProfile extends StatefulWidget {
  const AdminProfile({Key? key}) : super(key: key);

  @override
  State<AdminProfile> createState() => _AdminProfileState();
}

class _AdminProfileState extends State<AdminProfile> {
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
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/background.jpg"),
                    fit: BoxFit.cover)),
            child: Card(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 60),
              elevation: 20,
              shadowColor: Colors.black,
              color: Colors.white,
              child: Container(
                width: 330,
                height: 570,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                            'https://images.unsplash.com/photo-1566041510394-cf7c8fe21800?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
                        fit: BoxFit.fill)),
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 100,
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(
                              'https://i.pinimg.com/736x/94/09/7e/94097e458fbb22184941be57aaab2c8f.jpg'),
                          radius: 100,
                          backgroundColor: Colors.white54,
                        ), //CircleAvatar
                      ), //CircleAvatar
                      SizedBox(
                        height: 10,
                      ), //SizedBox
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Name: ${name}',
                          style: optionStyle,
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
                          'Employee Id: ${employeeId}',
                          style: optionStyle,
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
                          'Email Id: ${email}',
                          style: optionStyle,
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
                          'Contact Number: ${personalContactNumber}',
                          style: optionStyle,
                          softWrap: true,
                          maxLines: 2,
                          overflow: TextOverflow.fade,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 50.0,
                        child: RaisedButton(
                          onPressed: () {
                            clearData();
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) {
                                  return Login();
                                },
                              ),
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
                                "Log-Out",
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                      // Align(
                      //   alignment: Alignment.topLeft,
                      //   child: Row(
                      //     children: [
                      //       Text(
                      //         'Email : ',
                      //         style: optionStyle, //Textstyle
                      //         softWrap: false,
                      //         overflow: TextOverflow.ellipsis,
                      //       ),
                      //       Text(
                      //         'wardenboy@jklu.edu',
                      //         style: optionStyle, //Textstyle
                      //         softWrap: false,
                      //         maxLines: 2,
                      //         overflow: TextOverflow.fade, //ne
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      // SizedBox(
                      //   height: 15,
                      // ),
                      // Align(
                      //   alignment: Alignment.topLeft,
                      //   child: Row(
                      //     children: [
                      //       Text(
                      //         'Personal No : ',
                      //         style: optionStyle, //Textstyle
                      //       ),
                      //       Text(
                      //         '093242098 ',
                      //         style: optionStyle, //Textstyle
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      // SizedBox(
                      //   height: 15,
                      // ),
                      //SizedBox
                      // SizedBox(
                      //   width: 80,
                      //   child: RaisedButton(
                      //     onPressed: () => null,
                      //     color: Colors.green,
                      //     child: Padding(
                      //       padding: const EdgeInsets.all(4.0),
                      //       child: Row(
                      //         children: [
                      //           Icon(Icons.touch_app),
                      //           Text('Visit'),
                      //         ],
                      //       ), //Row
                      //     ), //Padding
                      //   ), //RaisedButton
                      // ) //SizedBox
                    ],
                  ), //Column
                ),
              ), //SizedBox
            ),
          ), //Card
        ), //Center
      ),
    );
  }

  void clearData() async {
    SessionManager sessionManager = SessionManager();
    await sessionManager.eraseData();
  }
}
