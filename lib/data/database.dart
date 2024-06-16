import 'package:hive_flutter/hive_flutter.dart';

class ToDoDatabase {
  List toDoList = [];
  //reference the box
  final _myBox = Hive.box('myBox');
//1st time openning
  void createInitialData() {
    toDoList = [
      ["Make Tutorial", false],
      ["Make Tutorial", false]
    ];
  } // loading

  void loadData() {
    toDoList = _myBox.get("TODOLIST");
  }

//updating
  void updateData() {
    _myBox.put("TODOLIST", toDoList);
  }
}
