import 'package:agriidetect/ui/screens/signup_page.dart';
import 'package:flutter/material.dart';

import 'package:page_transition/page_transition.dart';

import '../../utils/constants.dart';



class SignIn extends StatelessWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(

      body:Stack(
        children: [
          Container(

            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/back.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 60,
            left: 30,
            child: Material(

              borderRadius: BorderRadius.all(Radius.circular(50)),
              child:CircleAvatar(
    radius: 50,
    backgroundImage: AssetImage('assets/images/playstore.png'),
    ),
            ),
          ),
          Positioned(
            top: 180,
            left: 30,
            child: Text(
              'Everyone should\nlive with a little\nmore green.',
              style: TextStyle(
                fontFamily: 'Roboto Slab',
                fontSize: 30,
                color: Colors.white,
              ),
            ),
          ),
          Positioned(
            top: 300,//530
            left: 40,
            right: 40,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 30,
                ),

      TextField(

        decoration: InputDecoration(
          filled: true,
          prefixIcon :Icon(Icons.alternate_email),
          fillColor: Colors.white,
          border: OutlineInputBorder(),
          hintText: 'Enter Email',

        ),

        obscureText: false,
      ),

                const SizedBox(
                  height: 20,
                ),

                TextField(
                  obscureText: true,
                  decoration: InputDecoration(     prefixIcon:Icon (Icons.lock),
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(),

    hintText: 'Enter Password',

                  ),

    ),
                const SizedBox(
                  height: 20,
                ),



Row(
  children: [
      Expanded(child:Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20),),
          color:Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 12,bottom: 12,left: 50,right: 50),
          child: Text(
            'Sign in',
            style:  TextStyle(
              fontFamily: 'Roboto Slab',
              fontSize: 18,
              color: Color.fromRGBO(18,58,57,1).withOpacity(0.8),
            ),
          ),
        ),
      ), ) ,

    Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),

    ),

        Expanded(
          child: GestureDetector(
          onTap: (){
            Navigator.push(context,MaterialPageRoute(builder: (context){
              return SignUp();
            }),);
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20),),
              color: Color.fromRGBO(18,58,57,1).withOpacity(0.8),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 15,bottom: 15,left: 50,right: 50),
              child: Text(
                'Sign up',
                style:  TextStyle(
                  fontFamily: 'Roboto Slab',

                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),),
],
),

                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: const [
                    Expanded(child: Divider(color: Colors.white,)),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text('OR',    style:  TextStyle(


                        color: Colors.white,
                      ),),
                    ),
                    Expanded(child: Divider(color: Colors.white,)),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: size.width,
                  decoration: BoxDecoration(
                      border: Border.all(color: Color.fromRGBO(18,58,57,1).withOpacity(0.8)),
                      borderRadius: BorderRadius.circular(10)),
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        height: 30,
                        child: Image.asset('assets/images/google.png'),
                      ),
                      Text(
                        'Sign IN with Google',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                        ),
                      ),
                    ],
                  ),
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
