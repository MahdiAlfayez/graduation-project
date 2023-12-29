// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unnecessary_new, use_build_context_synchronously, prefer_final_fields, sort_child_properties_last

import 'dart:convert';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:project/header_width.dart';
import 'package:project/model/classposttest.dart';
import 'package:project/theme_helper.dart';
import 'package:project/view/admindachbord.dart';
import 'package:project/view/singup.dart';
import 'package:project/view/testpage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  GlobalKey<FormState> formState = GlobalKey();

  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();

  loginphp() async {
    final SharedPreferences userdata = await SharedPreferences.getInstance();

    var url = "http://10.0.2.2/server/login.php";

    print(email.text);
    print(password.text);
    final resbon = await http.post(Uri.parse(url),
        body: {"emil": email.text, "password": password.text});
    var testa = jsonDecode(resbon.body);
    //print( testa['data'][0]['ID'].toString());

    if (testa['stutes'] == "find") {
      userdata.setString('ID', testa['data'][0]['ID']);
      userdata.setString('username', testa['data'][0]['username']);
      userdata.setString('rool', testa['data'][0]['rool']);
      userdata.setString('phonenumber', testa['data'][0]['phonenumber']);
      userdata.setString('email', testa['data'][0]['email']);
      userdata.setString('image', testa['data'][0]['image'].toString());
      Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) {
          return MyHomePage();
        },
      ));
    } else if (testa['stutes']  == "nottrue") {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('you need for vrdi code ')));
    } else if (testa['stutes']  == "not found") {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Roung email or password')));
    }
  }

  double _headerHeight = 250;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: _headerHeight,
              child: HeaderWidget(_headerHeight, true, Icons.login_rounded),
            ),

            //هنا راح يكون المربع الي في صفحة اللوق ان

            SafeArea(
                child: Container(
              padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
              margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: Column(
                children: [
                  Text(
                    'Hello',
                    style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Signin into your account',
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Form(
                    key: formState,
                    child: Column(
                      children: [
                        Container(
                          child: TextFormField(
                            controller: email,
                            decoration: ThemeHelper().TextInputDecoration(
                                'Email address',
                                'Enter Email address or phone number'),
                            keyboardType: TextInputType.emailAddress,
                            validator: (val) {
                              if ((val!.isEmpty)) {
                                return "Enter Email address or phone number";
                              }
                              return null;
                            },
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        // TextField(
                        //   decoration: ThemeHelper().TextInputDecoration(
                        //       'user name', 'Enter username or phone number'),
                        // ),
                        SizedBox(
                          height: 30.0,
                        ),
                        Container(
                          child: TextFormField(
                            controller: password,
                            decoration: ThemeHelper().TextInputDecoration(
                                'password', 'Enter Your password'),
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Please enter your password";
                              }
                              return null;
                            },
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        SizedBox(height: 15.0),
                        Container(
                          margin: EdgeInsets.fromLTRB(10, 0, 10, 20),
                          alignment: Alignment.topRight,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => test()),
                              );
                            },
                            child: Text(
                              "Forgot your password?",
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          decoration:
                              ThemeHelper().buttonBoxDeceration(context),
                          child: ElevatedButton(
                            style: ThemeHelper().buttonStyle(),
                            child: Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(40, 10, 40, 10),
                              child: Text(
                                "sign In".toUpperCase(),
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            onPressed: () {
                              if (formState.currentState!.validate()) {
                                loginphp();
                                // Navigator.of(context).pushAndRemoveUntil(
                                //     MaterialPageRoute(
                                //         builder: (context) => MyHomePage()),
                                //     (Route<dynamic> route) => false);
                              }
                            },
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(10, 20, 60, 20),
                          // child: Text('Don\'t have an account? create '),
                          child: Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                    text: "Don\'t have an account ? ",
                                    style: TextStyle(
                                      fontSize: 15,
                                    )),
                                TextSpan(
                                    text: "create",
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => sinup(),
                                          ),
                                        );
                                      },
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(context).accentColor)),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
