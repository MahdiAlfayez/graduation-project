// ignore_for_file: unused_local_variable, prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:http/http.dart' as http;
import 'package:project/view/cart.dart';

import 'package:project/view/crud/additem.dart';

import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences userdata;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  userdata = await SharedPreferences.getInstance();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}
  // Color _primaryColor = HexColor('#DC54FE');
  // Color _accentColor = HexColor('#BA02AE');

  // Color _primaryColor = HexColor('#FFC867');
  // Color _accentColor = HexColor('#FF3CBD');

  // Our Logo Color
  Color _primaryColor = HexColor('#D44CF6');
  Color _accentColor = HexColor('#5E18C8');

  // Our Logo Blue Color
  //Color _primaryColor= HexColor('#651BD2');
  //Color _accentColor= HexColor('#320181');
class _MyAppState extends State<MyApp> {
  getdata() async {
    var url = "http://10.0.2.2/server/show.php";

    var resbon = await http.get(Uri.parse(url));
    var jeson = jsonDecode(resbon.body);

    print('--------------------------');
    print(resbon.body);

    return jeson;
  }

  @override
  void initState() {
    super.initState();
  }

  var userrool=userdata.get('rool');

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: _primaryColor,
        accentColor: _accentColor,
        scaffoldBackgroundColor: Colors.grey.shade100,
        primarySwatch: Colors.grey,
      ),
      debugShowCheckedModeBanner: false,
      
      
      home: // additem()  //cart() 
       userrool == null ? SplashScrean() :userrool=='admin'? MyHomePage():sinup()



        );
  }
}
