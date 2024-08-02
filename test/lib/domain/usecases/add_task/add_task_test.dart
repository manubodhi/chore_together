import 'package:chore_together/features/domain/entities/task.dart';
import 'package:chore_together/features/domain/repositories/task_repository.dart';
import 'package:chore_together/features/domain/usecases/add_task.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockTaskRepository extends Mock implements TaskRepository {}

void main() {
  late AddTask useCase;
  late MockTaskRepository mockTaskRepository;

  setUp(() {
    mockTaskRepository = MockTaskRepository();
    useCase = AddTask(mockTaskRepository);
  });

  final task = Task(
    id: 1,
    name: 'Test Task',
    duration: 30,
    author: 'Author',
    assignee: 'Assignee',
  );

  test("should add task to repository", () async {
    // arrange
    when(mockTaskRepository.addTask(task))
        .thenAnswer((_) async => Future.value());

    // act
    await useCase(task);

    // assert
    verify(mockTaskRepository.addTask(task));
    verifyNoMoreInteractions(mockTaskRepository);
  });
}
