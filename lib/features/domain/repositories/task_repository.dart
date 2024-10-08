import 'package:chore_together/features/domain/entities/task.dart';

abstract class TaskRepository{
  Future<void> addTask(Task task);
  Future<List<Task>> getTasks();
}