import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String name;
  VoidCallback onPressed;
  final Color btncolor;
   MyButton({
    super.key,
    required this.name,
    required this.onPressed,
    required this.btncolor
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(onPressed: onPressed,
    child: Text(name),
    color: btncolor,
    );
  }
}