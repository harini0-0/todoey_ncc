// ignore: unused_import
import 'package:flutter/material.dart';
import 'taskModel.dart';

class TaskData extends ChangeNotifier {
  List<TaskModel> tasklist = [
    TaskModel(taskname: 'Buy Milk', isDone: false),
    TaskModel(taskname: 'Buy Eggs', isDone: false),
    TaskModel(taskname: 'Buy Bottles', isDone: false),
  ];

  int get taskCount {
    return tasklist.length;
  }

  String title(int index) {
    return tasklist[index].taskname;
  }

  bool isDone(int index) {
    return tasklist[index].isDone;
  }

  void addTask(String newTaskTitle) {
    final task = TaskModel(taskname: newTaskTitle, isDone: false);
    tasklist.add(task);
    notifyListeners();
  }

  void updateTask(int index) {
    tasklist[index].toggleVar();
    notifyListeners();
  }

  void deleteTask(int index) {
    tasklist.remove(tasklist[index]);
    notifyListeners();
  }
}
