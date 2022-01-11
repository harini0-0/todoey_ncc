import 'package:flutter/material.dart';
import 'package:todoey_ncc/Model/taskData.dart';
import 'Screens/todoeyfirstpage.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskData(),
      child: MaterialApp(
        home: HomeScreen(),
      ),
    );
  }
}
