import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TaskTile extends StatelessWidget {
  final String txt;
  final bool status;
  Function(bool?)? onchanged;
  void Function(BuildContext)? deleteFunction;

  TaskTile(
      {required this.txt,
      required this.status,
      this.onchanged,
      this.deleteFunction});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30, left: 25, right: 25, bottom: 4),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
                onPressed: deleteFunction,
                backgroundColor: Colors.white,
                foregroundColor: Colors.purple[300],
                icon: Icons.delete,
                label: 'Delete',
                borderRadius: BorderRadius.circular(10)),
          ],
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
            color: Colors.purple[300],
          ),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Row(
            children: [
              Checkbox(
                  activeColor: Colors.black,
                  value: status,
                  onChanged: onchanged),
              Text(
                txt.toString(),
                style: TextStyle(
                  fontSize: 18,
                  decoration:
                      status ? TextDecoration.lineThrough : TextDecoration.none,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
