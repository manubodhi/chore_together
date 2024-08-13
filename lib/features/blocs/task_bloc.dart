import 'package:chore_together/core/error/task_error.dart';
import 'package:chore_together/features/domain/entities/task.dart';
import 'package:chore_together/features/domain/usecases/add_task.dart';
import 'package:chore_together/features/domain/usecases/get_tasks.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final AddTask addTask;
  final GetTasks getTasks;

  TaskBloc({required this.addTask, required this.getTasks})
      : super(TaskInitial()) {
    on<LoadTasks>((event, emit) async {
      emit(TaskLoading());
      try {
        final tasks = await getTasks();
        emit(TaskLoaded(tasks));
      } catch (_) {
        emit(TaskError('Failed to load the tasks'));
      }
    });

    on<CreateTask>((event, emit) async {
      try {
        await addTask(event.task);
        add(LoadTasks());
      } catch (_) {
        emit(TaskError('Failed to add task'));
      }
    });
  }
}
