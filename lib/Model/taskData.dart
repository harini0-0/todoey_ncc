import 'package:flutter/material.dart';
import 'taskModel.dart';

class TaskData {
  List<TaskModel> tasklist = [
    TaskModel(taskname: 'Buy Milk', isDone: false),
    TaskModel(taskname: 'Buy Eggs', isDone: false),
    TaskModel(taskname: 'Buy Bottles', isDone: false),
  ];
}
