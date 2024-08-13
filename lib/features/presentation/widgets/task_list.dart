import 'package:flutter/material.dart';

import '../../domain/entities/task.dart';

class TaskList extends StatelessWidget {
  final List<Task> tasks;

  const TaskList({super.key, required this.tasks});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        final task = tasks[index];
        return ListTile(
          title: Text(task.name),
          subtitle: Text(
              'Duration: ${task.duration} mins \nAuthor: ${task.author} \nAssignee: ${task.assignee}'),
        );
      },
    );
  }
}
