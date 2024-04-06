// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:to_do_app/util/my_button.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback save;
  VoidCallback clear;
   DialogBox({super.key,
  required this.clear,
  required this.save,
  required this.controller
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor:Colors.yellow[300],
      content: Container(
      
      height: 200,
      width: 400,
      child:  Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [TextField(
        
         autofocus: true,
          controller: controller ,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: "Add a new task",
            
          ),
            
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
         MyButton(name: "Save", onPressed: save,btncolor: Colors.yellow,),
        SizedBox(width: 30,),
        MyButton(name: "clear", onPressed: clear,btncolor: Colors.yellow,)
          ],
        )
        ],
      ),),
    );
  }
}