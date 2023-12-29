import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:project/main.dart';
import 'package:project/view/loginmethoud.dart';
import 'package:project/view/profile_page.dart';
import 'package:project/view/singup.dart';
import 'package:project/view/testpage.dart';
import 'package:simple_sidebar/simple_sidebar.dart';
import 'package:simple_sidebar/simple_sidebar_item.dart';
import 'package:simple_sidebar/simple_sidebar_theme.dart';

class MyHomePage extends StatefulWidget {
  final List<SimpleSidebarItem> sidebarItems = [
    SimpleSidebarItem(
        title: "Home",
        iconFront: Icons.home_outlined,
        child: const Center(child: login())),
    SimpleSidebarItem(
        title: "Gallery",
        iconFront: Icons.image_outlined,
        child: const Center(child: sinup())),
    SimpleSidebarItem(
        title: "Users",
        iconFront: Icons.group_outlined,
        child: const Center(child: Text("Users"))),
    SimpleSidebarItem(
        title: "Extra long name for a menu item",
        wrapWord: true,
        iconFront: Icons.settings,
        child: const Center(child: Profilpage())),
    SimpleSidebarItem(
      title: "log",
      iconEnd: Icons.close,
      child: test(),
    )
  ];

  MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selected = 0;
  bool isVisible = true;
  String username = userdata.getString('username').toString();
  var image = userdata.get('image');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("here"),
          actions: [
            IconButton(
                onPressed: () {
                  userdata.clear();
                  Navigator.pushReplacement(context, MaterialPageRoute(
                    builder: (context) {
                      return login();
                    },
                  ));
                },
                icon: Icon(Icons.logout_outlined))
          ],
        ),
        backgroundColor: Colors.blueGrey[800],
        body: Row(
          children: [
            SimpleSidebar(
              simpleSidebarTheme: SimpleSidebarTheme(
                  titleTextTheme: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  selectedTextColor: Colors.white,
                  unselectedTextColor: Colors.grey,
                  selectedIconColor: Colors.white,
                  unselectedIconColor: Colors.grey),
              titleText: " "+username,
              titleImage: image == null
                  ? Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        
                       
                      ),
                      child: Icon(Icons.person) ,
                    )
                  : Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        image: DecorationImage(
                          image: NetworkImage(
                            "http://10.0.2.2/server/Uplod/.$image",
                          ),
                          fit: BoxFit.cover,
                          onError: (exception, stackTrace) {},
                        ),
                      ),
                    ),
              initialExpanded: false,
              sidebarItems: widget.sidebarItems,
              collapsedString: "Close",
              expandedString: "Expand Me :)",
              onTapped: (value) => onTapped(value),
              toggleSidebar: (value) {
                // log("Sidebar is now $value");
              },
            ),
            Expanded(
              child: AnimatedOpacity(
                opacity: isVisible ? 1 : 0,
                duration: const Duration(milliseconds: 400),
                child: Container(
                    margin: const EdgeInsets.all(8),
                    child: widget.sidebarItems.elementAt(selected).child),
              ),
            )
          ],
        ));
  }

  void onTapped(int value) {
    setState(() {
      isVisible = false;
    });
    Future.delayed(const Duration(milliseconds: 400), () {
      setState(() {
        selected = value;
      });
    }).then((value) {
      setState(() {
        isVisible = true;
      });
    });
  }
}
