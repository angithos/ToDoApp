import 'package:hive_flutter/hive_flutter.dart';

class ToDoDatabase{


List toDoList=[];
final _myBox =Hive.box('mybox');

void CreateInitialData(){
  toDoList=[
   ["Make video",false],
   ["Go gym",false],
  ];
}
  //laod the data
  void loadData(){
toDoList=_myBox.get("TODOLIST");
  }

void UpdateDataBase(){
  _myBox.put("TODOLIST",toDoList);
  }

  


}