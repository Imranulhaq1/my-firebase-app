import 'package:flutter/material.dart';

class MediaApp extends StatelessWidget {
  const MediaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Row(
                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                             //crossAxisAlignment: CrossAxisAlignment.end,
                             children: [
                               InkWell(
                                 onTap: (){
                                  //print("on Top");
                                 },
                                 child: Image.asset('assets/goo.png',
                                 width: 70,
                                 height: 70,
                                 ),
                               ),
                               SizedBox(width: 10,),
                               InkWell(
                                 onTap: (){
                                  //print("on Top");
                                 },
                                 child: Image.asset('assets/feac.png',
                                 width: 70,
                                 height: 70,
                                 ),
                               ),
                               SizedBox(width: 10,),
                               InkWell(
                                 child: Image.asset('assets/link.png',
                                 width: 70,
                                 height: 70,
                                 ),
                               ),
                              
                             ],
                           ),
      
    
                     Text('Login with social media account',style: TextStyle(fontWeight: FontWeight.bold,
                     color:  Colors.blue,
                     ),),
      ],
    );
  }
}