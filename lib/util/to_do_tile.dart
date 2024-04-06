

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTile extends StatelessWidget {

  final String taskName;
  final bool isCompleted;
  Function (bool?)? onChanged;
  Function (BuildContext)?deleteFunction;

   ToDoTile({super.key,
   required this.taskName,
   required this.isCompleted,
   required this.onChanged,
   required this.deleteFunction});

  @override
  Widget build(BuildContext context) {
    var fontstyle=TextStyle(
      fontSize: 19,
      decoration: isCompleted? TextDecoration.lineThrough:TextDecoration.none,
    );
    return Padding(
      padding: const EdgeInsets.only(top:25.0,left: 25.0,right: 25.0),
      child: Slidable(
        endActionPane: ActionPane(motion: StretchMotion(),
         children: [
          SlidableAction(onPressed: deleteFunction,
          icon: Icons.delete,
          backgroundColor: Colors.red,
          borderRadius: BorderRadius.circular(10),
          )
         ]),
        child: Container(
          padding: EdgeInsets.all(25),
          decoration: BoxDecoration(
          color: Colors.yellow,
          borderRadius: BorderRadius.circular(10)),
          child: Row(
            children: [
              Checkbox(value: isCompleted, onChanged: onChanged,
              activeColor: Colors.black,),
              Text(taskName,style: fontstyle,),
            ],
          ),
        ),
      ),
    );

  }
}