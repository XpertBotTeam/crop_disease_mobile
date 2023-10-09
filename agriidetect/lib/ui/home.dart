
import 'package:agriidetect/models/plant_widget.dart';
import 'package:agriidetect/ui/screens/signin_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../controllers/diseases_controller.dart';

import '../models/diseaes_model.dart';


import '../utils/constants.dart';


List<Datum> _users = <Datum>[];
List<Datum> _usersDisplay = <Datum>[];
bool _isLoading = true;
final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
late Future<Disease> diseaselist ;
late int index;
DiseasesController diseasesController=new DiseasesController();
TextEditingController editingController = TextEditingController();



class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


    @override
    void initState() {
      super.initState();

      diseasesController.getdisease().then((value) {
        setState(() {
          _isLoading = false;
          _users.addAll(value.data);
          _usersDisplay = _users;

        });
      });
    }

    @override
    Widget build(BuildContext context) {
      Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor:  Color.fromRGBO(18,58,57,1),
          actions: [
        TextButton(
            onPressed: () async {
              final SharedPreferences? prefs = await _prefs;
              prefs?.clear();
              Get.offAll(SignIn());
            },
            child: Icon(
              Icons.logout,
              color: Colors.cyanAccent,
            ))
      ]),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [


            Container(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                    ),
                    width: size.width * .9,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.search,
                          color: Colors.black54.withOpacity(.6),
                        ),
                        Expanded(
                            child:TextField(


                              onChanged: (searchText) {
                                searchText = searchText.toLowerCase();
                                setState(() {
                                  _usersDisplay = _users.where((u) {
                                    var fName = u.name.toLowerCase();

                                    return fName.contains(searchText) ;
                                  }).toList();
                                });
                              },

                              decoration: InputDecoration(
                                hintText: 'Search Plant',
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                              ),
                            )),

                      ],
                    ),
                    decoration: BoxDecoration(
                      color: Constants.primaryColor.withOpacity(.1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  )
                ],
              ),
            ),





LayoutBuilder(builder:(context,Constraints) {
  if(Constraints.maxWidth>600){
    return wideLayout();
  }else{
    return NarrowLayout();
  }

}

    )

















          ],
        ),
      )
    );
  }


}
class wideLayout extends StatelessWidget {
  const wideLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [Expanded(
        child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            height: MediaQuery.of(context).size.height/1.5,
            child:diseaseslist(),


        ),
      flex: 2,),
      Expanded(child: Placeholder(),flex: 3,)],
    ) ;
  }
}

class NarrowLayout extends StatelessWidget {
   NarrowLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          height: MediaQuery.of(context).size.height/1.5,
          child:diseaseslist()

      );
  }

}

class diseaseslist extends StatelessWidget {
  const diseaseslist({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _usersDisplay.length + 1,
      scrollDirection: Axis.vertical,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        if (!_isLoading) {
          return index == 0 ? _searchBar() : PlantWidget(
              diseaselist: _usersDisplay[index - 1], index: index - 1);
        } else {
          return Align(
            alignment: Alignment.topCenter,
            child: CircularProgressIndicator(),
          );
        }
      },


    );
  }
  _searchBar() {
    return Padding(
      padding: EdgeInsets.all(12.0),
      child:Container(
        padding: const EdgeInsets.only(left: 16, bottom: 20, top: 10),
        child: const Text(
          'Diseases Type',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
      ),
    );
  }
}
