import 'package:flutter/material.dart';
import 'package:my_first_flutter_app/provider/TaskModel.dart';
import 'package:provider/provider.dart';
import 'package:my_first_flutter_app/library/globals.dart' as globals;

class ListAllTasksWidget extends StatelessWidget {
  const ListAllTasksWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskModel>(builder: (context, model, child) {
      return ListView.builder(
          itemCount: model.todoTasks.length,
          itemBuilder: (BuildContext context, int index) {
            String key = model.todoTasks.keys.elementAt(index);
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(globals.taskCategoryNames[key]!,
                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),
                    ),
                  ),
                  ListView.builder(
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      itemCount: model.todoTasks[key]!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 225, 225, 225),
                                border: Border.all(
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    width: 1),
                                borderRadius: BorderRadius.circular(10)),
                            child: ListTile(
                              contentPadding: EdgeInsets.zero,
                              title: Text(model.todoTasks[key]![index].title),
                              subtitle: Text(model.todoTasks[key]![index].deadline
                                  .toString()
                                  .substring(0, 10)),
                              leading: Checkbox(
                                value: model.todoTasks[key]![index].status,
                                onChanged: (bool? value) {
                                  print(model.todoTasks[key]![index].status);
                                  model.markAsDone(key, index);
                                },
                              ),
                            ),
                          ),
                        );
                      })
                ],
              ),
            );
          });
    });
  }
}
