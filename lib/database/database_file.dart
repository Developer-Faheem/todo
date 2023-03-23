import 'package:hive/hive.dart';

class toDoDatabase {
  List task = [
    // ['1st task', false],
    // ['2nd task', true]
  ];

  //referencing the box
  final _mybox = Hive.box('mybox');

  //creating the initial data when ever the db is opened
  void createInitialData() {
    List task = [
      ['1st task', false],
      ['2nd task', true]
    ];
  }

  void loadData() {
    task = _mybox.get('TASKS'); //getting value using the key TASKS
  }

  void updateData() {
    _mybox.put('TASKS', task); //data store in the hive as the key value pair
  }
}
