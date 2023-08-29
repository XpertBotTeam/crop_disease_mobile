import 'dart:convert';


import 'package:agriidetect/ui/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/api_endpoints.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();


  Future<void> loginWithEmail() async {
    var headers = {'Content-Type': 'application/json'};
    try {
      var url = Uri.parse(
          ApiEndPoints.baseUrl + ApiEndPoints.authEndpoints.loginEmail);
      Map body = {
        'email': emailController.text.trim(),
        'password': passwordController.text
      };
      http.Response response =
          await http.post(url, body: jsonEncode(body), headers: headers);

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);

        if (json['success'] == true) {

          showAlertDialog(Get.context!, "SUCCESS", "Authentication Successful");
          emailController.clear();
          passwordController.clear();
          Get.off(HomeScreen());
        }else{
          showAlertDialog(Get.context!,"ERROR","incorrect id or password");
        }
      }
    } catch (error) {
      Get.back();
      showAlertDialog(Get.context!,"No Internet","Check your internet connection.");
    }
  }
}
void showAlertDialog(BuildContext context, String ttle,String message){
  Widget okButton=TextButton(onPressed: (){
    Navigator.of(context).pop();
  }, child: Text("Okay"));
  AlertDialog alert=AlertDialog(title: Text(ttle),content: Text(message),
    actions: [okButton],);
  showDialog(context: context, builder: (BuildContext context){
    return alert;
  });
}