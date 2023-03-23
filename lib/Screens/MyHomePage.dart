import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo/components/dialog_box.dart';

import '../components/task_tile.dart';
import '../database/database_file.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //reference the hive box
  final _myBox = Hive.box('mybox');
  toDoDatabase db = toDoDatabase();

  void initState() {
    //if the box is openeing for the very first time
    if (_myBox.get("TASKS") == null) {
      db.createInitialData();
    } else {
      db.loadData(); ////this not the 1st time
    }
    super.initState();
  }

  // List task = [
  //   ['1st task', false],
  //   ['2nd task', true]
  // ];

  checking(int index) {
    setState(() {
      db.task[index][1] = !db.task[index][1];
    });
    db.updateData();
  }

  addTask() {
    // setState(() {});
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return DialogBox(
            taskList: updateAddState,
          );
        });
  }

  updateAddState(String txt, bool status) {
    setState(() {
      db.task.add([txt.toString(), status]);
    });
    db.updateData();
  }

  deleteTask(int index) {
    setState(() {
      db.task.remove(db.task[index]);
    });
    db.updateData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TODO'),
        centerTitle: true,
        elevation: 1,
      ),
      backgroundColor: Colors.purple[200],
      body: ListView.builder(
        itemCount: db.task.length,
        itemBuilder: (context, index) {
          return TaskTile(
            txt: db.task[index][0],
            status: db.task[index]![1],
            deleteFunction: (context) => deleteTask(index),
            onchanged: (value) {
              checking(index);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addTask();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
