import 'package:flutter/material.dart';
import 'package:flutter_homework_8/Program%20Brain/tasks.dart';
import 'package:flutter_homework_8/components/task_on_board.dart';

class ListTasks extends StatefulWidget {
  final List<Task> tasks;
  const ListTasks({
    Key? key,
    required this.tasks,
  }) : super(key: key);

  @override
  State<ListTasks> createState() => _ListTasksState();
}

class _ListTasksState extends State<ListTasks> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.tasks.length,
        itemBuilder: ((context, index) {
          return TaskOnBoard(
            addTaskName: widget.tasks[index].taskName,
            isChecked: widget.tasks[index].isDone,
            checkBoxChange: (newValue) {
              setState(() {
                widget.tasks[index].changeState();
              });
            },
          );
        }));
  }
}
