import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_ncc/Model/taskData.dart';
// import 'taskData';

// ignore: must_be_immutable
class ModalBottomSheet extends StatelessWidget {
  var onset = '';
  @override
  Widget build(BuildContext context) {
    return Container(
        // height: 300,
        child: Column(
      children: [
        Text(
          "Add Task",
          style: TextStyle(fontSize: 20),
        ),
        TextField(
          autofocus: true,
          onChanged: (newText) {
            onset = newText;
            print(onset);
          },
        ),
        TextButton(
            onPressed: () {
              print(onset);
              Provider.of<TaskData>(context, listen: false).addTask(onset);
              Navigator.pop(context);
              print(Provider.of<TaskData>(context, listen: false).taskCount);
            },
            child: Text(
              'Submit',
              style: TextStyle(fontSize: 20),
            ))
      ],
    ));
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}
