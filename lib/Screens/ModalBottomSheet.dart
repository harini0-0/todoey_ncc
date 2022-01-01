import 'package:flutter/material.dart';

class ModalBottomSheet extends StatefulWidget {
  const ModalBottomSheet({Key? key}) : super(key: key);

  @override
  _ModalBottomSheetState createState() => _ModalBottomSheetState();
}

class _ModalBottomSheetState extends State<ModalBottomSheet> {
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
        TextField(),
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              'Submit',
              style: TextStyle(fontSize: 20),
            ))
      ],
    ));
  }
}
