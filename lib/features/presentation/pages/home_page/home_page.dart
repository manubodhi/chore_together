import 'package:chore_together/features/blocs/task_bloc.dart';
import 'package:chore_together/features/presentation/widgets/task_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('House chores'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/add_task');
        },
        child: Icon(Icons.add),
      ),
      body: BlocBuilder<TaskBloc, TaskState>(
        builder: (context, state) {
          if (state is TaskLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is TaskLoaded) {
            return TaskList(tasks: state.tasks);
          } else if (state is TaskError) {
            return Center(
              child: Text(state.message),
            );
          }
          return Center(
            child: Text('No tasks available'),
          );
        },
      ),
    );
  }
}
