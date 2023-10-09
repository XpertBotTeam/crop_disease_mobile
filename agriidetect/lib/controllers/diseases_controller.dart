import 'dart:convert';



import 'package:flutter/material.dart';
import 'package:get/get.dart';


import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../models/diseaes_model.dart';

import '../utils/api_endpoints.dart';

class DiseasesController extends GetxController {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();



  Future<Disease> getdisease() async {

    var url = Uri.parse(
        ApiEndPoints.baseUrl + ApiEndPoints.authEndpoints.diseases);
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {


      return Disease.fromJson(json.decode(response.body)) ;}
    else {
      throw Exception('Failed to load ');
    }
  }

  Future<bool> addImage(Map<String, String> body,String filepath) async {
    final SharedPreferences? prefs = await _prefs;
    var token=prefs?.get('token');
    Map<String, String> headers = {
      'Content-Type': 'multipart/form-data',

      'Authorization': 'Bearer $token'
    };
    var request = http.MultipartRequest('POST', Uri.parse(  ApiEndPoints.baseUrl + ApiEndPoints.authEndpoints.photo))
      ..fields.addAll(body)
      ..headers.addAll(headers)
      ..files.add(await http.MultipartFile.fromPath('image', filepath));
    var response = await request.send();
    if (response.statusCode == 201) {
      print('imahe upload');
      return true;
    } else {print(response.statusCode);
      return false;
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