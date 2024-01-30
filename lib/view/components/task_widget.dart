import 'package:flutter/material.dart';
import 'package:todo_cubit/model/task.dart';
import 'package:todo_cubit/view_model/myCubits/cubit/note_cubit.dart';
import 'package:todo_cubit/view_model/utils/colors.dart';

import '../../view_model/enums/task_type.dart';

class TaskWidget extends StatelessWidget {
  final Task task;
  const TaskWidget({
    super.key,
    required this.task,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.seconderColor, width: 1.5),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                task.title ?? '',
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                task.date ?? '',
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                task.time ?? '',
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Visibility(
                    visible: task.status == TasksType.all ||
                        task.status == TasksType.archived,
                    child: InkWell(
                      onTap: () {
                        NoteCubit.get(context)
                            .changeTaskType(task.id ?? 0, TasksType.done);
                      },
                      child: Icon(
                        Icons.done_all,
                        size: 30,
                        color: AppColors.green,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  if (task.status == TasksType.done ||
                      task.status == TasksType.all)
                    InkWell(
                      onTap: () {
                        NoteCubit.get(context)
                            .changeTaskType(task.id ?? 0, TasksType.archived);
                      },
                      child: Icon(
                        Icons.archive_rounded,
                        color: AppColors.black,
                        size: 25,
                      ),
                    ),
                  const SizedBox(
                    width: 10,
                  ),
                  Visibility(
                    visible: true,
                    child: InkWell(
                      onTap: () {
                        NoteCubit.get(context).removeTask(task.id ?? 0);
                      },
                      child: Icon(
                        Icons.delete,
                        size: 30,
                        color: AppColors.red,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
