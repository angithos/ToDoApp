import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_app/data/database.dart';
import 'package:to_do_app/util/dialog_box.dart';
import 'package:to_do_app/util/to_do_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

final _myBox=Hive.box('mybox');
ToDoDatabase db =ToDoDatabase();

@override
  void initState() {
    if(_myBox.get("TODOLIST")==null){
      db.CreateInitialData();
    }
    else{
      db.loadData();
    }
    super.initState();
  }
final _controller=TextEditingController();
void SaveNewtask(){
  setState(() {
    db.toDoList.add([_controller.text,false]);
    _controller.clear();
  });
  Navigator.of(context).pop();
}




void createNewtask(){
  showDialog(context: context, builder: (context){
 return DialogBox(controller: _controller,
 save: SaveNewtask,
 clear: () => Navigator.of(context).pop(),

 );
  });
  db.UpdateDataBase();
} 



  void checkBoxChanged(bool? value,int index){
  setState(() {
    db.toDoList[index][1]=!db.toDoList[index][1];
  });
  db.UpdateDataBase();
  }


 
 void deleteTask(int index){
 setState(() {
   db.toDoList.removeAt(index);
 });
 db.UpdateDataBase();
 }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        title: Text("TODO APP"),
      ),
      floatingActionButton: FloatingActionButton(onPressed:createNewtask,
      child: Icon(Icons.add),
      
      ),
     body:ListView.builder(itemCount: db.toDoList.length,
     itemBuilder: (context, index) {
       return ToDoTile(
        taskName:db.toDoList[index][0],
        isCompleted: db.toDoList[index][1],
        onChanged: (value) =>checkBoxChanged(value,index),
        deleteFunction: (context)=> deleteTask(index),
       );
     },
    ));
  }
}