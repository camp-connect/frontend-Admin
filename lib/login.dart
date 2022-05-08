import 'dart:convert';
import 'package:admin/config.dart';
import 'package:admin/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:admin/sessionManager.dart';
import 'package:motion_toast/motion_toast.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  bool _pisObscure = true;
  TextEditingController _emailTEC = TextEditingController();
  TextEditingController _passwordTEC = TextEditingController();

  // @override
  // void initState() {
  //   super.initState();
  //   check_if_already_login();
  // }
  //
  // void check_if_already_login() async {
  //   SessionManager sessionManager = SessionManager();
  //   var newUser = (await sessionManager.loginGet() == null) ? true : false;
  //   print(newUser);
  //   if (newUser == false) {
  //     Navigator.pushReplacement(
  //         context, new MaterialPageRoute(builder: (context) => DashBoard()));
  //   }
  // }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _emailTEC.dispose();
    _passwordTEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              'Login',
              style: TextStyle(color: Colors.black),
            ),
            // leading: IconButton(
            //   icon: Icon(Icons.arrow_back, color: Colors.black),
            //   onPressed: () => Navigator.of(context).pop(),
            // ),
            backgroundColor: Colors.white,
            elevation: 0,
          ),
          body: Container(
            constraints: BoxConstraints.expand(),
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                      'images/empty-pure-white-background_476151-236.webp'),
                  fit: BoxFit.cover),
            ),
            child: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 20.5, horizontal: 15),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      Text(
                        'Welcome back!',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 25.2,
                            fontFamily: 'opensans-ExtraBold'),
                      ),
                      Text(
                        'We are so excited to see you again!',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15.2,
                            fontFamily: 'opensans-ExtraBold'),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 18),
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Email required !';
                            } else if (!value.contains('@jklu.edu.in')) {
                              return 'Enter your institutional email id';
                            }
                            return null;
                          },
                          controller: _emailTEC,
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
                            focusedErrorBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              borderSide:
                                  BorderSide(color: Colors.red, width: 2),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              borderSide:
                                  BorderSide(color: Colors.red, width: 2),
                            ),
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
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Password  required !';
                            } else if (value.length < 6) {
                              return 'Password length must be greater than 6 !';
                            }
                            return null;
                          },
                          controller: _passwordTEC,
                          obscureText: _pisObscure,
                          autocorrect: true,
                          decoration: InputDecoration(
                            hintText: 'Password',
                            prefixIcon: Icon(Icons.password),
                            hintStyle: TextStyle(color: Colors.grey),
                            filled: true,
                            fillColor: Colors.white70,
                            focusedErrorBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              borderSide:
                                  BorderSide(color: Colors.red, width: 2),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              borderSide:
                                  BorderSide(color: Colors.red, width: 2),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              borderSide:
                                  BorderSide(color: Colors.black26, width: 2),
                            ),
                            labelText: 'Password',
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              borderSide:
                                  BorderSide(color: Colors.blue, width: 2),
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _pisObscure
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                              onPressed: () {
                                setState(() {
                                  _pisObscure = !_pisObscure;
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: 1, horizontal: 23),
                          child: GestureDetector(
                            onTap: () {
                              MotionToast.info(
                                      title: Text("Info"),
                                      description: const Text("Coming Soon "))
                                  .show(context);
                            },
                            child: Text(
                              'Forget your password?',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: 1, horizontal: 23),
                          child: Text(
                            'Note * :  Please, Login after admin approval !',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 50.0,
                        child: RaisedButton(
                          elevation: 10,
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              login();
                            }
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(80.0),
                          ),
                          padding: EdgeInsets.all(0.0),
                          child: Ink(
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Color(0xff374ABE),
                                    Color(0xff64B6FF)
                                  ],
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                ),
                                borderRadius: BorderRadius.circular(30.0)),
                            child: Container(
                              constraints: BoxConstraints(
                                  maxWidth: 300.0, minHeight: 50.0),
                              alignment: Alignment.center,
                              child: Text(
                                "Login",
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
              ),
            ),
          ),
        ),
      ),
    );
  }

  void loginHelper(String msg) async {
    String username = _emailTEC.text;
    SessionManager sessionManger = SessionManager();
    await sessionManger.loginSet(username, false);
    print('Successfull');
    print(await sessionManger.loginGet());
    MotionToast.success(
      title: Text("Success"),
      description: Text(msg),
      width: 300,
    ).show(context);
    Future.delayed(Duration(milliseconds: 1000), () {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => DashBoard()),
          (route) => false);
    });
  }

  void login() async {
    String uri = config.server;
    String path = '/campconnectadminapi/adminLoginApi.php';
    Map<String, String> headers = {"Access-Control-Allow-Origin": "*"};

    Map<String, String> body = {
      'EmailId': _emailTEC.text,
      'Passwords': _passwordTEC.text
    };
    SessionManager sessionManager = SessionManager();
    try {
      final response =
          await http.post(Uri.http(uri, path), headers: headers, body: body);

      final String str = jsonEncode(await response.body.toString());
      final decodedjson = jsonDecode(str);
      Map<String, dynamic> map = jsonDecode(decodedjson);
      // List list = map as List
      var code = map['error'];
      if (code == 200) {
        loginHelper(map['message'].toString());
      } else {
        print('no');
        MotionToast.error(
                title: Text("Error"), description: Text(map['message']))
            .show(context);
      }
      List<String> list = [];
      list.add(map['user']['EmailId']);
      list.add(map['user']['Name']);
      list.add(map['user']['EmployeeId']);
      list.add(map['user']['PersonalContactNumber']);

      print(map['error']);
      print(response.body.toString());
      print(list);
      await sessionManager.profileDataSet(list);
    } catch (err) {
      print(err.toString());
    }
  }
}
