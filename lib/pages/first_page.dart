import 'package:flutter/material.dart';
import 'package:flutter_homework_8/Program%20Brain/tasks.dart';
import 'package:flutter_homework_8/components/tasks_list.dart';
import 'package:flutter_homework_8/pages/setting_page.dart';

import 'add_tasks.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  var pages = [SettingPage];
  List<Task> tasks = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: (() {
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: ((context) => SingleChildScrollView(
                  child: AddTasks(addTaskCallBack: (newTaskName) {
                    setState(() {
                      print(newTaskName);
                      tasks.add(Task(taskName: newTaskName));
                    });
                  }),
                )),
          );
        }),
        backgroundColor: const Color(0xFFb35648),
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: ((context) => const SettingPage())));
            },
            child: const Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: Icon(
                Icons.settings,
                size: 40.0,
              ),
            ),
          ),
        ],
        centerTitle: false,
        backgroundColor: const Color(0xFFb35647),
        title: const Padding(
          padding: EdgeInsets.only(left: 50.0),
          child: Text(
            'Today',
            style: TextStyle(
              color: Colors.white,
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: ListTasks(
        tasks: tasks,
      ),
    );
  }
}
