import 'package:chore_together/features/blocs/task_bloc.dart';

class TaskError extends TaskState{
  final String message;
  const TaskError(this.message);

  @override
  List<Object> get props => [message];
}