// ignore_for_file: empty_constructor_bodies

import 'dart:convert';

class loginpost{

final email;
final password;
loginpost({this.email,this.password});


// factory loginpost.formJson(Map<String,dynamic>json){
// return loginpost(
// email: json ['email'],
// password: json['password']

  
// );

// }


Map<String,dynamic>toJsonAdd(){
return {
"email":email,
"password":password

};


}
}