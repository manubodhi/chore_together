import 'package:chore_together/features/data/models/task_model.dart';
import 'package:chore_together/features/domain/entities/task.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class TaskLocalDataSource {
  static final TaskLocalDataSource _instance = TaskLocalDataSource._internal();

  factory TaskLocalDataSource() => _instance;

  TaskLocalDataSource._internal();

  Database? _dataBase;

  Future<Database> get database async {
    if (_dataBase != null) {
      return _dataBase!;
    }
    _dataBase = await _initDb();
    return _dataBase!;
  }

  Future<Database> _initDb() async {
    String path = join(await getDatabasesPath(), 'tasks.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        return db.execute('''
      CREATE TABLE tasks(
      id INTEGER PRIMARY KEY,
      name TEXT,
      duration TEXT,
      author TEXT,
      assignee TEXT
      )
      ''');
      },
    );
  }

  Future<void> addTask(TaskModel task) async {
    final db = await database;
    await db.insert('tasks', task.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<TaskModel>> getTasks() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('tasks');
    return List.generate(maps.length, (index) {
      return TaskModel.fromJson(maps[index]);
    });
  }
}
