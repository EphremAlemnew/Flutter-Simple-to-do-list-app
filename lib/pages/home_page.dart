// ignore_for_file: prefer_const_constructors

import 'package:f_firstapp/data/database.dart';
import 'package:f_firstapp/util/dialog_box.dart';
import 'package:f_firstapp/util/todo_tile.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // text controller
  final _myBox = Hive.box('myBox');
  final _controller = TextEditingController();
  //List of todo tasks
  ToDoDatabase db = ToDoDatabase();

  @override
  void initState() {
    if (_myBox.get("TODOLIST") == null) {
      db.createInitialData();
    } else {
      db.loadData();
    }

    super.initState();
  }
  // List toDoList = [
  //   ['Make Tutorial', true],
  //   ['Do Exercise', false]
  // ];

// saving method
  void saveNewTask() {
    setState(() {
      db.toDoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateData();
  }

// check box was trapped

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateData();
  }

  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onSave: saveNewTask,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }
//delete task

  void deleteTask(int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.yellow[200],
        appBar: AppBar(
          title: Center(child: Text('Your Tasks')),
          elevation: 0,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: createNewTask,
          child: Icon(Icons.add),
        ),
        body: ListView.builder(
          itemCount: db.toDoList.length,
          itemBuilder: (context, index) {
            return ToDoTile(
              taskName: db.toDoList[index][0],
              taskCompleted: db.toDoList[index][1],
              onChanged: (value) => checkBoxChanged(value, index),
              deleteFunction: (context) => deleteTask(index),
            );
          },
        )
        //   children: [
        //     ToDoTile(
        //       taskName: 'Make Tutorial',
        //       taskCompleted: true,
        //       onChanged: (p0) {},
        //     ),
        //     ToDoTile(
        //       taskName: 'Exercise',
        //       taskCompleted: false,
        //       onChanged: (p0) {},
        //     ),
        //   ],
        // ),
        );
  }
}


/////////////////---------------for Navigation ----------------///////////////////
// class HomePage extends StatelessWidget {
//   const HomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(child: Text('Home Page')),
//     );
//   }
// }

/////////////////////------------------ for Navigation --------------------- //////////////
