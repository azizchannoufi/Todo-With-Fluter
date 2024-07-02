import 'package:flutter/material.dart';
import 'package:my_first_flutter_app/provider/TaskModel.dart';
import 'package:my_first_flutter_app/widget/ListTasksWidget.dart';
import 'package:provider/provider.dart';

class ListTaskView extends StatefulWidget {
  const ListTaskView({super.key});

  @override
  State<ListTaskView> createState() => _ListTaskViewState();
}

class _ListTaskViewState extends State<ListTaskView> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
          appBar: AppBar(
            title: const Text('List Tasks'),
            bottom: const TabBar(
              isScrollable: true,
              tabs: [
                Tab(text: "All Tasks",),
                Tab(text: "Today",),
                Tab(text: "tomorrow",),
                Tab(text: "This Week",),
                Tab(text: "Next Week",),

              ],
            ),
          ),
          body: TabBarView(
            children: [
              ListTasksWidget(),
              ListTasksWidget(),
              ListTasksWidget(),
              ListTasksWidget(),
              ListTasksWidget(),

            ],
          ),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              Navigator.pushNamed(context,"AddTask");
            }
          ),
          ),
    );
  }
}
