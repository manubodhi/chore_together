import 'package:chore_together/features/blocs/task_bloc.dart';
import 'package:chore_together/features/data/data_sources/task_local_data_source.dart';
import 'package:chore_together/features/data/repositories/task_repository_impl.dart';
import 'package:chore_together/features/domain/usecases/add_task.dart';
import 'package:chore_together/features/domain/usecases/get_tasks.dart';
import 'package:chore_together/features/presentation/pages/add_task_page/add_task_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/presentation/pages/home_page/home_page.dart';

void main() {
  final taskRepository =
      TaskRepositoryImpl(localDataSource: TaskLocalDataSource());
  final addTaskUseCase = AddTask(taskRepository);
  final getTasksUseCase = GetTasks(taskRepository);

  runApp(
    MyApp(
      addTask: addTaskUseCase,
      getTasks: getTasksUseCase,
    ),
  );
}

class MyApp extends StatelessWidget {
  final AddTask addTask;
  final GetTasks getTasks;
  const MyApp({super.key, required this.addTask, required this.getTasks});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => TaskBloc(addTask: addTask, getTasks: getTasks),
        ),
      ],
      child: MaterialApp(
        title: 'Chore together',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HomePage(),
        routes: {'/add_task': (context) => const AddTaskPage()},
      ),
    );
  }
}
