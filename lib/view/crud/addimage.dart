// ignore_for_file: unused_element

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart'as http;
class addimage extends StatefulWidget {
  const addimage({super.key});

  @override
  State<addimage> createState() => _addimageState();
}

class _addimageState extends State<addimage> {

File ?_image;

Future choceimag()async{
final myfile  =await ImagePicker().pickImage(source: ImageSource.camera);

setState(() {
  _image=File(myfile!.path);
});

}


Future uplodimage()async{
if(_image==null){
return;
  
}
else{

String base64=base64Encode(_image!.readAsBytesSync());
print(base64);
print("--------------------------");
print(_image);
print("--------------------------");
String imagename=_image!.path.split("/").last;
print(imagename);

var url="http://10.0.2.2/server/image.php";
var resbon= await http.post(Uri.parse(url),body:{
"imagename":imagename,
"image64":base64

} );
}

}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(children: [

Container(
child:_image==null?Text('no slect image'):Image.file(_image!) ,

),

ElevatedButton(onPressed: () {
  choceimag();
}, child: Text("choce image")),

ElevatedButton(onPressed: () {
  uplodimage();
}, child: Text("uplod image")),

Image.network("http://10.0.2.2/server/uplod/.a0a01d27-7aee-41bc-8b0f-f22ece478a4b3631264371898365524.jpg")

        ]),
      )),
    );
  }
}
