import 'package:agriidetect/ui/screens/signup_page.dart';
import 'package:flutter/material.dart';






class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {


    return Container(

      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/back.jpg'),
         fit: BoxFit.cover,
        ),
      ),

child: Scaffold(
  backgroundColor: Colors.transparent,
      body:Stack(
     children:[
Container(),
       Container(
         padding: EdgeInsets.only(left: 30, top: 40),


         child:       Material(

           borderRadius: BorderRadius.all(Radius.circular(50)),
           child:CircleAvatar(
             radius: 50,
             backgroundImage: AssetImage('assets/images/playstore.png'),
           ),
         ),
       ),
       Container(
         padding: EdgeInsets.only(left: 30, top: 140),

         child: Text(
           'Everyone should\nlive with a little\nmore green.',
           style: TextStyle(
             fontFamily: 'Roboto Slab',
             fontSize: 30,
             color: Colors.white,
           ),
         ),
       ),




      SingleChildScrollView(

    child: Container(
    padding: EdgeInsets.only(
    top: MediaQuery
        .of(context)
        .size
        .height * 0.5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    margin: EdgeInsets.only(left: 35, right: 35),
                    child: Column(
                        children: [

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
      Expanded(

      child: GestureDetector(
      onTap: (){},
        child:Container(
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
      ), )) ,

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
                  width: MediaQuery.of(context).size.width,
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


                      GestureDetector(
                          onTap: (){    Navigator.push(context,MaterialPageRoute(builder: (context){
                            return SignUp();
                          }),);},
                    child:  Text(
                        'Sign IN with Google',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                        ),
                  )  ),
                    ],
                  ),
                ),

  ])) ],
            )
    ),
      )
     ]

              ),
    ) );
  }
}
