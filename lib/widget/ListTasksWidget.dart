import 'package:flutter/material.dart';
import 'package:my_first_flutter_app/provider/TaskModel.dart';
import 'package:provider/provider.dart';
import 'package:my_first_flutter_app/library/globals.dart' as globals;

class ListTasksWidget extends StatelessWidget {
  const ListTasksWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskModel>(builder: (context, model, child) {
      return ListView.builder(
          itemCount: model.todoTasks[globals.today]!.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 225, 225, 225),
                    border: Border.all(
                        color: Color.fromARGB(255, 0, 0, 0), width: 1),
                    borderRadius: BorderRadius.circular(10)),
                child: CheckboxListTile(
                  title: Text(model.todoTasks[globals.today]![index].title),
                  subtitle: Text(model.todoTasks[globals.today]![index].deadline
                      .toString()
                      .substring(0, 10)),
                  value: model.todoTasks[globals.today]![index].status,
                  onChanged: (bool? value) {
                    print(model.todoTasks[globals.today]![index].status);
                    model.markAsDone(globals.today,index);
                  },
                  controlAffinity: ListTileControlAffinity.leading,
                ),
              ),
            );
          });
    });
  }
}
