import '../view_model/enums/task_type.dart';

class Task {
  int? id;
  String? title;
  String? date;
  String? time;
  TasksType? status;

  Task({
    this.id,
    this.title,
    this.time,
    this.date,
    this.status,
  });
}