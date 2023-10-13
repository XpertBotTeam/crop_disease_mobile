import 'dart:convert';



import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';



import '../ui/screens/widgets/BottomNavBarState.dart';
import '../utils/api_endpoints.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController oldpasswordController = TextEditingController();
  TextEditingController newpasswordController = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  var token;
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


       token = json['token'];
        final SharedPreferences? prefs = await _prefs;
        await prefs?.setString('token', token);




        if (json['success'] == true) {

          showAlertDialog(Get.context!, "SUCCESS", "Authentication Successful");

            emailController.clear();
            passwordController.clear();
            Get.off(BottomNavBarState());

        }else{
          showAlertDialog(Get.context!,"ERROR","incorrect id or password");
        }
      }
    } catch (error) {
      Get.back();
      showAlertDialog(Get.context!,"No Internet","Check your internet connection.");
    }
  }
  Future<void> updatepassword() async {
    var headers = {'Content-Type': 'application/json',    'Authorization': 'Bearer $token'};

    try {
      var url = Uri.parse(
          ApiEndPoints.baseUrl + ApiEndPoints.authEndpoints.update);
      Map body = {
        'old_password': oldpasswordController.text,
        'new_password': newpasswordController.text,
        'confirm_password':confirmpasswordController.text,
      };
      http.Response response =
          await http.post(url, body: jsonEncode(body), headers: headers);

      if (response.statusCode == 200) {









        oldpasswordController.clear();
        newpasswordController.clear();
        confirmpasswordController.clear();
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