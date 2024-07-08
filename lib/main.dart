import 'package:flutter/material.dart';
import 'package:my_first_flutter_app/provider/TaskModel.dart';
import 'package:my_first_flutter_app/view/AddTasksView.dart';
import 'package:my_first_flutter_app/view/ListTaskView.dart';
import 'package:provider/provider.dart';

void main() {
 runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => TaskModel()),
        ],
        child: const MyApp(),
      ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes:  {
        "listTasks":(context)=> ListTaskView(),
        "addTask":(context)=> AddTasksView(),
      },
      home: ListTaskView()
    );
  }
}