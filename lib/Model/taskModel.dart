import 'package:flutter/material.dart';

// ignore: camel_case_types
class TaskModel {
  String taskname;
  bool isDone;

  TaskModel({required this.taskname, required this.isDone});

  void toggleVar() {
    this.isDone = !this.isDone;
  }
}
