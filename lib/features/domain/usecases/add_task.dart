import 'package:chore_together/features/domain/repositories/task_repository.dart';

import '../entities/task.dart';

class AddTask {
  final TaskRepository repository;

  AddTask(this.repository);

  Future<void> call(Task task) async {
    return await repository.addTask(task);
  }
}