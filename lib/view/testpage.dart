import 'package:flutter/material.dart';
import 'package:project/main.dart';
import 'package:project/view/chekemail.dart';
import 'package:project/view/loginmethoud.dart';
import 'package:project/view/singup.dart';

class test extends StatefulWidget {
  const test({super.key});

  @override
  State<test> createState() => _testState();
}

class _testState extends State<test> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar: AppBar(),

body:Center(child: Column(children: [

ElevatedButton(onPressed: () {
  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
    return login();

  },));
}, child: Text("login")),
ElevatedButton(onPressed: () {
  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
    return sinup();

  },));
}, child: Text("register"))
,
ElevatedButton(onPressed: () {
  // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
  //   return chek(email:"test");

  // },));
}, child: Text("verd cod")),

ElevatedButton(onPressed: () {
 userdata.clear();
}, child: Text("clere saherd")),

ElevatedButton(onPressed: () {
 print(userdata.getString('email'));
}, child: Text("print saherd"))



],)) ,


    );
  }
}