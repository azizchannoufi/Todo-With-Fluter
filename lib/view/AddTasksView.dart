import 'package:flutter/material.dart';
import 'package:my_first_flutter_app/model/Task.dart';
import 'package:my_first_flutter_app/provider/TaskModel.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:my_first_flutter_app/library/globals.dart' as globals;

class AddTasksView extends StatefulWidget {
  const AddTasksView({super.key});

  @override
  State<AddTasksView> createState() => _AddTasksViewState();
}

class _AddTasksViewState extends State<AddTasksView> {
  DateTime _selectedDay = DateTime.now();

  DateTime _focusedDay = DateTime.now();
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();



  @override
  Widget build(BuildContext context) {
      return Consumer<TaskModel>(builder: (context, model, child) {
      return Scaffold(
          appBar: AppBar(
            title: Text('Add Tasks'),
          ),
          body: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(children: <Widget>[
                TableCalendar(
                  calendarFormat: CalendarFormat.week,
                  firstDay: DateTime.utc(2010, 1, 1),
                  lastDay: DateTime.utc(2030, 3, 14),
                  focusedDay: _focusedDay,
                  selectedDayPredicate: (day) {
                    return isSameDay(_selectedDay, day);
                  },
                  onDaySelected: (selectedDay, focusedDay) {
                    setState(() {
                      _selectedDay = selectedDay;
                      _focusedDay = focusedDay; // update `_focusedDay` here as well
                    });
                  },
                  onPageChanged: (focusedDay) {
                    _focusedDay = focusedDay;
                  },
                  calendarBuilders: CalendarBuilders(
                    markerBuilder: (context, datetime, events) {
                      return Container(
                        width: 25,
                        height: 10,
                        decoration: BoxDecoration(
                            color: globals.primaries[2],
                            borderRadius: BorderRadius.circular(4.0)),
                      );
                    },
                    selectedBuilder: (context, datetime, focusedDay) {
                      return Container(
                        decoration: BoxDecoration(
                            color: globals.primaries[1],
                            borderRadius: BorderRadius.circular(20.0)),
                        margin:
                            EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
                        child: Center(
                          child: Text(
                            datetime.day.toString(),
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50.0,right: 15.0,left: 15.0),
                  child: TextFormField(
                    controller: _titleController,
                    maxLength: 50,
                    decoration: InputDecoration(
                        hintText: "Enter task title",
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide: BorderSide(
                            color: Colors.blue,
                            width: 2.0,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide: BorderSide(
                            color: Colors.blue,
                            width: 2.0,
                          ),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide: BorderSide(
                            color: Colors.red,
                            width: 2.0,
                          ),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide: BorderSide(
                            color: Colors.red,
                            width: 2.0,
                          ),
                        ),
                        ),
                     validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextFormField(
                    controller: _descriptionController,
                    maxLength: 500,
                    maxLines: 5,
                    minLines: 3,
                    decoration: InputDecoration(
                        hintText: "Enter task discrption (optionel)",
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide: BorderSide(
                            color: Colors.blue,
                            width: 2.0,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide: BorderSide(
                            color: Colors.blue,
                            width: 2.0,
                          ),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide: BorderSide(
                            color: Colors.red,
                            width: 2.0,
                          ),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide: BorderSide(
                            color: Colors.red,
                            width: 2.0,
                          ),
                        ),
                        ),
                     
                  ),
                ),
              ]),
            ),
          ),
          floatingActionButton: FloatingActionButton(
              child: Icon(Icons.done),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  Task _newTask =Task(_titleController.text,false,_descriptionController.text,_focusedDay);
                  model.add(_newTask);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Task Saved')),
                  );
                  Navigator.pushReplacementNamed(context,'listTasks');
                }
              }),
              );
      }
    );
  }
  @override
void dispose() {
  // Clean up the controller when the widget is removed from the widget tree.
  // This also removes the _printLatestValue listener.
  _titleController.dispose();
  _descriptionController.dispose();

  super.dispose();
}
}
