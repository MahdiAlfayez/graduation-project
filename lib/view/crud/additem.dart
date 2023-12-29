import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:project/view/crud/showitem.dart';

class additem extends StatefulWidget {
  const additem({super.key});

  @override
  State<additem> createState() => _additemState();
}

class _additemState extends State<additem> {
  GlobalKey<FormState> formstate = GlobalKey();

TextEditingController name=TextEditingController();
TextEditingController price=TextEditingController();
TextEditingController stock=TextEditingController();
TextEditingController category=TextEditingController();
TextEditingController description=TextEditingController();

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

var url="http://10.0.2.2/server/additem.php";
var resbon= await http.post(Uri.parse(url),body:{
"name":name.text,
"price":price.text,
"stock":stock.text,
"description":description.text,
"category":category.text,  
"imagename":imagename,
"image64":base64
} );
var jesondata=jsonDecode(resbon.body);
print(jesondata);
}


}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Form(
          key: formstate,
          child: Column(
            children: [
              _image==null?
      
      Container( height:60 ,width:60 ,color:Colors.grey , child:Icon(Icons.image_sharp,size:30 ,) ):Container( height:60 ,width:60 , child:Image.file(_image!,fit:BoxFit.cover ,) ,),
      
      
              TextFormField(
                controller: name,
                decoration: InputDecoration(hintText: "enter name"),
              ),
              TextFormField(
                controller:price ,
                decoration: InputDecoration(hintText: "enter price"),
              ),
              TextFormField(
                controller:stock ,
                decoration: InputDecoration(hintText: "enter stock"),
              ),
              TextFormField(
                controller:description ,
                decoration: InputDecoration(hintText: "enter description"),
              ),
               TextFormField(
                controller: category,
                decoration: InputDecoration(hintText: "enter catecore"),
              ),
              SizedBox(height:10 ,),
      ElevatedButton(onPressed: () {
         choceimag();
      }, child: Text("choes image")),
      
      ElevatedButton(onPressed: () {

       uplodimage();
      }, child: Text("uplod image")),
      
      ElevatedButton(onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return showitem();
        },));
      }, child: Text("insert")),
      
            ],
          ),
        ),
      ),
    );
  }
}
