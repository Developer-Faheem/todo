import 'package:flutter/material.dart';

class DialogBox extends StatelessWidget {
  final Function taskList;
  const DialogBox({Key? key, required this.taskList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController taskInputController = TextEditingController();

    return AlertDialog(
      //  backgroundColor: Colors.purple[200],
      content: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextField(
              controller: taskInputController,
              decoration: InputDecoration(
                  enabled: true, hoverColor: Colors.purple[100]),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MaterialButton(
                    color: Colors.purple[300],
                    child: Text('Save'),
                    onPressed: () {
                      // taskList
                      //     .add([taskInputController.text.toString(), false]);
                      taskList(taskInputController.text, false);
                      Navigator.of(context).pop();
                    }),
                SizedBox(
                  width: 10,
                ),
                MaterialButton(
                  color: Colors.purple[300],
                  child: Text('Cancel'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
