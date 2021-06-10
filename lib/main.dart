import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey2/models/TaskData.dart';
import 'package:todoey2/screens/TasksScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => TaskData(),
      child: MaterialApp(
        title: 'Material App',
        debugShowCheckedModeBanner: false,
        home: TasksScreen(),
      ),
    );
  }
}
