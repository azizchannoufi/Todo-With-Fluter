import 'package:flutter/material.dart';

const List<MaterialColor> primaries = <MaterialColor>[
  Colors.red,
  Colors.pink,
  Colors.purple,
  Colors.deepPurple,
  Colors.indigo,
  Colors.blue,
  Colors.lightBlue,
  Colors.cyan,
  Colors.teal,
  Colors.green,
  Colors.lightGreen,
  Colors.lime,
  Colors.yellow,
  Colors.amber,
  Colors.orange,
  Colors.deepOrange,
  Colors.brown,
  Colors.blueGrey,
];

const late = "Late";
const today = "Today";
const tomorrow = "Tomorrow";
const thisWeek = "This Week";
const nextWeek = "Next Week";
const thisMonth = "This Month";
const later = "Later";

const Map<String, String> taskCategoryNames = {
  late: "Late",
  today: "Today",
  tomorrow: "Tomorrow",
  thisWeek: "This Week",
  nextWeek: "Next Week",
  thisMonth: "This Month",
  later: "Later"
};
//
const todoTasksKey="todo_tasks";
const doneTasksKey="done_tasks";