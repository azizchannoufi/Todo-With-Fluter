import 'package:flutter/material.dart';
import 'package:my_first_flutter_app/provider/TaskModel.dart';
import 'package:provider/provider.dart';
import 'package:my_first_flutter_app/library/globals.dart' as globals;

class ListTasksByTabWidget extends StatelessWidget {
  final String tabKey;
  const ListTasksByTabWidget({Key? key, required this.tabKey}):super(key:key);

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskModel>(builder: (context, model, child) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
            itemCount: model.todoTasks[tabKey]!.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 225, 225, 225),
                      border: Border.all(
                          color: Color.fromARGB(255, 0, 0, 0), width: 1),
                      borderRadius: BorderRadius.circular(10)),
                  child: ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(model.todoTasks[tabKey]![index].title),
                    subtitle: Text(model.todoTasks[tabKey]![index].deadline
                        .toString()
                        .substring(0, 10)),
                        leading: Checkbox(
                    value: model.todoTasks[tabKey]![index].status,
                    onChanged: (bool? value) {
                      print(model.todoTasks[tabKey]![index].status);
                      model.markAsDone(tabKey,index);
                    },
                        ),
                  ),
                ),
              );
            }),
      );
    });
  }
}
