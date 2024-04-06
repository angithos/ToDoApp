import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_app/pages/home_page.dart';
import 'package:to_do_app/pages/todo_page.dart';

void main() async{

  await Hive.initFlutter();

  var box= await Hive.openBox('mybox');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home:HomePage(),
      theme:ThemeData(primarySwatch: Colors.yellow,
      appBarTheme: AppBarTheme(color: Colors.yellow),
      floatingActionButtonTheme: FloatingActionButtonThemeData(backgroundColor: Colors.yellow),
     
     
      )
      );
      
  }
}


