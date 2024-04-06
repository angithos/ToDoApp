// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class toDoPage extends StatefulWidget {
  const toDoPage({super.key});

  @override
  State<toDoPage> createState() => _toDoPageState();
}

class _toDoPageState extends State<toDoPage> {

  TextEditingController textEditingController=TextEditingController();
 var greeting="";
  void greetUser(){
    var name =textEditingController.text;
    
    setState(() {
     greeting ="Hi, "+name;
    });
    
  }
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
  body: Center(
    child:Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(greeting),
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Enter your name",
            ),
            
            controller: textEditingController,
          ),
          ElevatedButton(onPressed: greetUser, child: Text("greet"))
        ],
      ),
    ) 
    ),
    );
  }
}