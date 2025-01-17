import 'package:flutter/material.dart';

import 'package:my_first_flutter_app/widget/ListAllTasksWidget.dart';
import 'package:my_first_flutter_app/widget/ListTasksByTabWidget.dart';
import 'package:my_first_flutter_app/library/globals.dart' as globals;

class ListTaskView extends StatefulWidget {
  const ListTaskView({Key? key}) : super(key: key);

  @override
  _ListTasksViewState createState() => _ListTasksViewState();
}

class _ListTasksViewState extends State<ListTaskView> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
          appBar: AppBar(
            title: Text("List Tasks"),
            bottom: const TabBar(
              isScrollable: true,
              tabs: [
                Tab(text:"All"),
                Tab(text:"Today"),
                Tab(text:"Tomorrow"),
                Tab(text:"This Week"),
                Tab(text:"Next Week"),
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              ListAllTasksWidget(),
              ListTasksByTabWidget(tabKey: globals.today),
              ListTasksByTabWidget(tabKey: globals.tomorrow),
              ListTasksByTabWidget(tabKey: globals.thisWeek),
              ListTasksByTabWidget(tabKey: globals.nextWeek),
            ],
          ),
          floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.pushNamed(context, 'addTask');
          },

      ),

      ),
    );
  }
}