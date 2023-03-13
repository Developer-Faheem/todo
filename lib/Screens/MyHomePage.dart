import 'package:flutter/material.dart';
import 'package:todo/components/dialog_box.dart';

import '../components/task_tile.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List task = [
    ['1st task', false],
    ['2nd task', true]
  ];

  checking(int index) {
    setState(() {
      task[index][1] = !task[index][1];
    });
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
      task.add([txt.toString(), status]);
    });
  }

  deleteTask(int index) {
    setState(() {
      task.remove(task[index]);
    });
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
        itemCount: task.length,
        itemBuilder: (context, index) {
          return TaskTile(
            txt: task[index][0],
            status: task[index]![1],
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
