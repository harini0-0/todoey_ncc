import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Model/taskData.dart';
import 'package:todoey_ncc/Screens/ModalBottomSheet.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Color(0xff3FC4FF),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Color(0xff3FC4FF),
        onPressed: () {
          showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (context) => SingleChildScrollView(
                    child: Container(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom),
                      child: ModalBottomSheet(),
                    ),
                  ));
        },
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                padding: EdgeInsets.all(40),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 35,
                      backgroundColor: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.list,
                          color: Color(0xff3FC4FF),
                          size: 40,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Todoey",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: Colors.white),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '${Provider.of<TaskData>(context, listen: true).taskCount} Tasks',
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ],
                )),
            Expanded(
                child: Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(40),
                    topLeft: Radius.circular(40)),
                color: Colors.white,
              ),
              child: Consumer<TaskData>(
                builder: (context, taskData, child) {
                  return ListView.builder(
                    itemCount:
                        Provider.of<TaskData>(context, listen: false).taskCount,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onLongPress: () {
                          Provider.of<TaskData>(context, listen: false)
                              .deleteTask(index);
                        },
                        child: ListTile(
                            title: Text(
                              "${Provider.of<TaskData>(context, listen: false).title(index)}",
                              style: TextStyle(
                                decoration: Provider.of<TaskData>(context,
                                            listen: false)
                                        .isDone(index)
                                    ? TextDecoration.lineThrough
                                    : null,
                              ),
                            ),
                            trailing: Checkbox(
                                value: Provider.of<TaskData>(context,
                                        listen: false)
                                    .isDone(index),
                                onChanged: (newvalue) {
                                  Provider.of<TaskData>(context, listen: false)
                                      .updateTask(index);
                                })),
                      );
                    },
                  );
                },
              ),
            ))
          ]),
    ));
  }
}
