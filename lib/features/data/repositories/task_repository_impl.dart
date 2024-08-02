import 'package:chore_together/features/data/models/task_model.dart';
import 'package:chore_together/features/domain/entities/task.dart';
import 'package:chore_together/features/domain/repositories/task_repository.dart';

import '../data_sources/task_local_data_source.dart';

class TaskRepositoryImpl implements TaskRepository {
  final TaskLocalDataSource localDataSource;

  TaskRepositoryImpl({required this.localDataSource});

  @override
  Future<void> addTask(Task task) async {
    return await localDataSource.addTask(TaskModel(
        id: task.id,
        name: task.name,
        duration: task.duration,
        author: task.author,
        assignee: task.assignee));
  }

  @override
  Future<List<Task>> getTasks() async{
    return await localDataSource.getTasks();
  }
}
