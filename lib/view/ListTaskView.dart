import 'package:flutter/material.dart';
import 'package:my_first_flutter_app/provider/TaskModel.dart';
import 'package:provider/provider.dart';

class ListTaskView extends StatefulWidget {
  const ListTaskView({super.key});

  @override
  State<ListTaskView> createState() => _ListTaskViewState();
}

class _ListTaskViewState extends State<ListTaskView> {
  @override
  Widget build(BuildContext context) {
      return Consumer<TaskModel>(
        builder: (context, model, child) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('List Tasks'),
            ),
            body: ListView.builder(
              itemCount:model.todoTasks.length,
              itemBuilder: (BuildContext context ,int index){
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 225, 225, 225),
                        border: Border.all(
                        color: Color.fromARGB(255, 0, 0, 0),
                        width: 1
                        ),
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: CheckboxListTile(
                        title: Text(model.todoTasks[index].title),
                        subtitle: Text(model.todoTasks[index].deadline.toString().substring(0,10)),
                        value: model.todoTasks[index].status,
                        onChanged: (bool? value) {  
                          print(model.todoTasks[index].status);
                          model.markAsDone(index);
                        }, 
                        controlAffinity: ListTileControlAffinity.leading,
                      ),
                    ),
                  );
            }
            ),
          );
       }
    );
  }
}