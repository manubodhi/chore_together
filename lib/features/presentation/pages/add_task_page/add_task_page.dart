import 'package:chore_together/features/blocs/task_bloc.dart';
import 'package:chore_together/features/domain/entities/task.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddTaskPage extends StatefulWidget {
  const AddTaskPage({super.key});

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _durationController = TextEditingController();
  final _authorController = TextEditingController();
  final _assigneeController = TextEditingController();

  void _addTask() {
    if (_formKey.currentState?.validate() ?? false) {
      final task = Task(
          name: _nameController.text,
          duration: _durationController.text,
          author: _authorController.text,
          assignee: _assigneeController.text);

      context.read<TaskBloc>().add(CreateTask(task));
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Task'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
            key: _formKey,
            child: ListView(
              children: <Widget>[
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(labelText: 'Task name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a task name';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _durationController,
                  decoration: InputDecoration(labelText: 'Duration name'),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the duration of the task';
                    }
                    if (int.tryParse(value) == null) {
                      return 'Please enter a valid number';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _authorController,
                  decoration: InputDecoration(labelText: 'Author name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter an author name';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _assigneeController,
                  decoration: InputDecoration(labelText: 'Assignee name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter an assignee name';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(onPressed: _addTask, child: Text('Add task'))
              ],
            )),
      ),
    );
  }
}
