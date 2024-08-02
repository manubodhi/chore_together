import 'package:flutter/foundation.dart';
import '../../domain/entities/task.dart';

class TaskModel extends Task {
  TaskModel({int? id, required String name, required int duration, required String author, required String assignee})
      : super(id: id, name: name, duration: duration, author: author, assignee: assignee);

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      id: json['id'],
      name: json['name'],
      duration: json['duration'],
      author: json['author'],
      assignee: json['assignee'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'duration': duration,
      'author': author,
      'assignee': assignee,
    };
  }
}
