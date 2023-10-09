

import 'package:flutter/material.dart';

class PlantImage extends StatelessWidget {
  const PlantImage({Key? key, required this.size, required this.imageFile}) : super(key: key);

  final Size size;
  final String imageFile;

  @override
  Widget build(BuildContext context) {
   return
   ClipRRect(
     borderRadius: BorderRadius.only(
       topLeft: Radius.circular(10.0),
       topRight: Radius.circular(10.0),
       bottomRight: Radius.circular(10.0),
      bottomLeft: Radius.circular(10.0),
     ),
     child: Image.network(imageFile,
          width: 500,
         height: 500,
         fit:BoxFit.cover

     ),
   );
  }
}
