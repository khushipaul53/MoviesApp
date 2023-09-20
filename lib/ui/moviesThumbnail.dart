import 'package:flutter/material.dart';

class  moviesThumbnail extends StatelessWidget {
  final String Thumbnail;

  const moviesThumbnail({super.key, required this.Thumbnail});

  @override
  Widget build(BuildContext context) {
   return Stack(
     children:<Widget>[
       Stack(
         alignment: Alignment.center,
         children: <Widget>[
           Container(
             width:MediaQuery.of(context).size.width,
             height: 200,
             decoration: BoxDecoration(
               image: DecorationImage(
                   image:NetworkImage(Thumbnail),
               fit: BoxFit.cover)
             ),
           ),
Icon(Icons.play_circle_outline,size: 100,
color: Colors.white)

         ],

       ),


     ]
   );

  }
}
