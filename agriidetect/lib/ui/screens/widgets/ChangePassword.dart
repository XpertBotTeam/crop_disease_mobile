import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../controllers/login_controller.dart';
import '../../../utils/constants.dart';
import 'custom_textfield.dart';

class PasswordUpdateForm extends StatefulWidget {
  @override
  _PasswordUpdateFormState createState() => _PasswordUpdateFormState();
}

class _PasswordUpdateFormState extends State<PasswordUpdateForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  LoginController loginController = Get.put(LoginController());

  void _handlePasswordUpdate() {
    // Implement your password update logic here
loginController.updatepassword();

    // Validate input and send a request to the backend
    // Update local state based on the backend response
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    bool locked = true;
    return  Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
  child:  Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text(
            'Edit Profile',
            style: TextStyle(
              fontSize: 35.0,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(
            height: 30.0,),
          TextFormField(
            obscureText: locked,
            validator:  MultiValidator([
              RequiredValidator(errorText: "* Required"),
              MinLengthValidator(6,
                  errorText: "Password should be atleast 6 characters"),
              MaxLengthValidator(15,
                  errorText:
                  "Password should not be greater than 15 characters")
            ]),
            controller: loginController.oldpasswordController,
            decoration: InputDecoration(
              prefixIcon: IconButton(
                icon: Icon(locked ? Icons.lock : Icons.lock_open, color: Constants.blackColor.withOpacity(.3),),

                onPressed: () {
                  setState(() {
                    locked = !locked;
                  });
                },
              ),
              hintText: 'Enter old Password',
              border: InputBorder.none,
            ),

          ),
          SizedBox(
            height: 30.0,),
          CustomTextfield(
                (value){
              if(value!.isEmpty)
                return '* Required';


            },
           loginController.newpasswordController,
            Icons.lock,
            true,
            'Enter New Password',

          ),
          SizedBox(
            height: 30.0,),
          CustomTextfield(
                (value){
              if(value!.isEmpty)
                return '* Required';
              if(value != loginController.newpasswordController.text)
                return 'Not Match';

            },
       loginController.confirmpasswordController,
            Icons.lock,
            true,
            'Confirm Password',

          ),

          SizedBox(
            height: 30.0,),

            GestureDetector(
              onTap: () {
                if (_formKey.currentState!.validate()) {
                  _handlePasswordUpdate();
                }
        },
              child: Container(
                width: size.width,
                decoration: BoxDecoration(
                  color: Constants.primaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                padding:
                const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                child: const Center(
                  child: Text(
                    'Update Password',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                    ),
                  ),
                ),
              ),
            ),

        ],
      ),
    ) );
  }
}
