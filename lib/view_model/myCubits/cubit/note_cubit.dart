import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../model/task.dart';
import '../../enums/task_type.dart';

part 'note_state.dart';

class NoteCubit extends Cubit<NoteState> {
  NoteCubit() : super(NoteInitial());

  static NoteCubit get(BuildContext context) {
    return BlocProvider.of(context);
  }

  var titleController = TextEditingController();
  var timeController = TextEditingController();
  var dateController = TextEditingController();

  int id = -1;
  List<Task> tasksList = [];

  void addTask() {
    tasksList.add(Task(
      id: id++,
      title: titleController.text,
      date: dateController.text,
      time: timeController.text,
      status: TasksType.all,
    ));
    emit(AddNewNote());
  }

  void removeTask(int taskId) {
    
    tasksList.removeWhere((element) => element.id == taskId);

    emit(RemoveNote());
  }

  void changeTaskType(int taskId, TasksType type) {
    tasksList.firstWhere((element) => element.id == taskId).status = type;
    emit(ChangeTaskTypeState());
  }

  //
  // List<Task> tasksList = [
  //   Task(
  //     id: 1,
  //     title: 'Task 1',
  //     description: 'Description 1',
  //     date: '01/01/2021',
  //     status: TasksType.all,
  //   ),
  //   Task(
  //     id: 2,
  //     title: 'Task 2',
  //     description: 'Description 2',
  //     date: '01/01/2021',
  //     status: TasksType.done,
  //   ),
  //   Task(
  //     id: 3,
  //     title: 'Task 3',
  //     description: 'Description 3',
  //     date: '01/01/2021',
  //     status: TasksType.archived,
  //   ),
  //   Task(
  //     id: 4,
  //     title: 'Task 4',
  //     description: 'Description 4',
  //     date: '01/01/2021',
  //     status: TasksType.all,
  //   ),
  //   Task(
  //     id: 5,
  //     title: 'Task 5',
  //     description: 'Description 5',
  //     date: '01/01/2021',
  //     status: TasksType.done,
  //   ),
  //   Task(
  //     id: 6,
  //     title: 'Task 6',
  //     description: 'Description 6',
  //     date: '01/01/2021',
  //     status: TasksType.archived,
  //   ),
  //   Task(
  //     id: 7,
  //     title: 'Task 7',
  //     description: 'Description 7',
  //     date: '01/01/2021',
  //     status: TasksType.all,
  //   ),
  //   Task(
  //     id: 8,
  //     title: 'Task 8',
  //     description: 'Description 8',
  //     date: '01/01/2021',
  //     status: TasksType.done,
  //   ),
  //   Task(
  //     id: 9,
  //     title: 'Task 9',
  //     description: 'Description 9',
  //     date: '01/01/2021',
  //     status: TasksType.archived,
  //   ),
  // ];
}
