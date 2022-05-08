import 'dart:convert';
import 'package:admin/login.dart';
import 'package:flutter/material.dart';
import 'package:admin/config.dart';
import 'package:http/http.dart' as http;
import 'package:motion_toast/motion_toast.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);
  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();
  bool _pisObscure = true;
  TextEditingController _emailTEC = TextEditingController();
  TextEditingController _passwordTEC = TextEditingController();
  TextEditingController _nameTEC = TextEditingController();
  TextEditingController _employeeIdTEC = TextEditingController();
  TextEditingController _contactNumberTEC = TextEditingController();

  var code;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              'Register',
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
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Center(
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 15.5, horizontal: 15),
                    child: Column(
                      children: <Widget>[
                        Text(
                          'Enter Email',
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'OpenSans-ExtraBold',
                              fontSize: 22.2,
                              fontStyle: FontStyle.normal),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 18),
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
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10.0),
                                ),
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
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 18),
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Password required !';
                              } else if (value.length < 6) {
                                return 'Password length must be greater than 6 !';
                              }
                              return null;
                            },
                            controller: _passwordTEC,
                            obscureText: _pisObscure,
                            autocorrect: true,
                            decoration: InputDecoration(
                              hintText: 'Enter Strong Password',
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
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 18),
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Name is required !';
                              }
                              return null;
                            },
                            controller: _nameTEC,
                            autocorrect: true,
                            decoration: InputDecoration(
                              hintText: 'Enter Name',
                              prefixIcon: Icon(Icons.person),
                              hintStyle: TextStyle(color: Colors.grey),
                              filled: true,
                              fillColor: Colors.white70,
                              enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                                borderSide:
                                    BorderSide(color: Colors.black26, width: 2),
                              ),
                              labelText: 'Name',
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
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 18),
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Employee Id is required !';
                              }
                              return null;
                            },
                            controller: _employeeIdTEC,
                            autocorrect: true,
                            decoration: InputDecoration(
                              hintText: 'Enter Employee Id',
                              prefixIcon: Icon(Icons.badge),
                              hintStyle: TextStyle(color: Colors.grey),
                              filled: true,
                              fillColor: Colors.white70,
                              enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                                borderSide:
                                    BorderSide(color: Colors.black26, width: 2),
                              ),
                              labelText: 'Employee Id',
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
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 18),
                          child: TextFormField(
                            keyboardType: TextInputType.phone,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Contact required !';
                              }
                              return null;
                            },
                            controller: _contactNumberTEC,
                            autocorrect: true,
                            decoration: InputDecoration(
                              hintText: 'Enter Personal Conatct Number',
                              prefixIcon: Icon(Icons.phone),
                              hintStyle: TextStyle(color: Colors.grey),
                              filled: true,
                              fillColor: Colors.white70,
                              enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                                borderSide:
                                    BorderSide(color: Colors.black26, width: 2),
                              ),
                              labelText: 'Contact Number',
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
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 18),
                            child: GestureDetector(
                              onTap: () {
                                MotionToast.info(
                                        title: Text("Info"),
                                        description: const Text("Coming Soon "))
                                    .show(context);
                              },
                              child: Text(
                                'Know Our Privacy Policy',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 12.2,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 50.0,
                          child: RaisedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                register();
                              }
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(80.0)),
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
                                  "Register",
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
      ),
    );
  }

  void register() async {
    String uri = config.server;
    String path = '/campconnectadminapi/adminRegistrationApi.php';
    Map<String, String> headers = {"Access-Control-Allow-Origin": "*"};

    Map<String, String> body = {
      'EmailId': _emailTEC.text,
      'Passwords': _passwordTEC.text,
      'Name': _nameTEC.text,
      'EmployeeId': _employeeIdTEC.text,
      'PersonalContactNumber': _contactNumberTEC.text
    };

    try {
      final response =
          await http.post(Uri.http(uri, path), headers: headers, body: body);

      final String str = jsonEncode(await response.body.toString());
      final decodedjson = jsonDecode(str);
      Map<String, dynamic> map = jsonDecode(decodedjson);
      code = map['error'];
      if (code == 200) {
        MotionToast.success(
          title: Text("Success"),
          description: Text(map['message']),
          width: 300,
        ).show(context);

        Future.delayed(Duration(milliseconds: 700), () {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) {
            return Login();
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
