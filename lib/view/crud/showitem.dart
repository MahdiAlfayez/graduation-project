import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:project/main.dart';

class showitem extends StatefulWidget {
  const showitem({super.key});

  @override
  State<showitem> createState() => _showitemState();
}

class _showitemState extends State<showitem> {
  getdata() async {
    var url = "http://10.0.2.2/server/showitem.php";

    var resbon = await http.get(Uri.parse(url));
    var jeson = jsonDecode(resbon.body);

    print('--------------------------');
    print(resbon.body);

    return jeson;
  }

  addtocart(var prodectid,var userid )async{

var url = "http://10.0.2.2/server/addcart.php";

    var resbon = await http.post(Uri.parse(url),body: {
"item_id":prodectid,
"user_id":userid


    });
    var jeson = jsonDecode(resbon.body);

    print('--------------------------');
    print(resbon.body);

    

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        future: getdata(),
        builder: (context, AsyncSnapshot snapshot) {
          
          if (snapshot.hasData == false) {
            return
            Center(
              child: CircularProgressIndicator(),
            );
          } else {
            
            return
            ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                var imag=snapshot.data[index]['UrlImage'];
                return 
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment:MainAxisAlignment.start ,
                    children: [
                      ListTile(
                title:Text(snapshot.data[index]['NameP']),
                trailing:Text(snapshot.data[index]['Price']) ,
                subtitle:Column(
                  children: [
                        Text(snapshot.data[index]['description']),
                        Text("category:"+snapshot.data[index]['category']),
                         IconButton(onPressed: () {
                           
                         }, icon: Icon(Icons.add)),
                         IconButton(onPressed: () {
                           
                         }, icon: Icon(Icons.minimize)),


                         IconButton(onPressed: () {
                           addtocart(snapshot.data[index]["IDP"], userdata.get("ID"));
                         }, icon: Icon(Icons.add_shopping_cart)),
                         
                  ],
                ) ,
                leading:Image.network("http://10.0.2.2/server/item/.$imag") ,
                      ),
                      
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
