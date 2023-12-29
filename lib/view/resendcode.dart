import 'package:flutter/material.dart';

class resendcode extends StatefulWidget {
  const resendcode({super.key});

  @override
  State<resendcode> createState() => _resendcodeState();
}

class _resendcodeState extends State<resendcode> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

appBar: AppBar(title:Text("re send code") ,),

body: Form(child: Column(children: [

TextFormField()

,
ElevatedButton(onPressed: () {
  
}, child: Text("send code"))
],)) ,

    );
  }
}