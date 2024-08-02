import 'package:chore_together/features/domain/repositories/task_repository.dart';

import '../entities/task.dart';

class GetTasks {
  final TaskRepository repository;

  GetTasks(this.repository);

  Future<List<Task>> call() async {
    return await repository.getTasks();
  }
}
