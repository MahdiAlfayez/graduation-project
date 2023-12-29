// ignore_for_file: unnecessary_new, prefer_const_constructors, sort_child_properties_last

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:project/view/loginmethoud.dart';


class SplashScrean extends StatefulWidget {
  const SplashScrean({super.key});

  @override
  State<SplashScrean> createState() => _SplashScreanState();
}

class _SplashScreanState extends State<SplashScrean> {
  bool _isVisible = false;
  _SplashScreanState() {
    new Timer(
      const Duration(milliseconds: 2000),
      () {
        setState(() {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (context) => login(),
              ),
              (route) => false);
        });
      },
    );

    new Timer(
      Duration(milliseconds: 10),
      () {
        setState(() {
          _isVisible = true;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: new BoxDecoration(
        gradient: new LinearGradient(
          colors: [
            Theme.of(context).accentColor,
            Theme.of(context).primaryColor
          ],
          begin: const FractionalOffset(0, 0),
          end: const FractionalOffset(1.0, 0.0),
          stops: [0.0, 1.0],
          tileMode: TileMode.clamp,
        ),
      ),
      child: AnimatedOpacity(
        opacity: _isVisible ? 1.0 : 0,
        duration: Duration(milliseconds: 1200),
        child: Center(
          child: Container(
            height: 140,
            width: 140,
            child: Center(
              child: ClipOval(
                child: Icon(
                  Icons.sports_mma_rounded,
                  size: 128,
                ), //الشعار حقنا
              ),
            ),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 2.0,
                      offset: Offset(5.0, 3.0),
                      spreadRadius: 2.0)
                ]),
          ),
        ),
      ),
    );
  }
}
