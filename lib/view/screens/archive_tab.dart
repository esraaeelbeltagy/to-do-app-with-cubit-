import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:todo_cubit/view/components/task_widget.dart';
import 'package:todo_cubit/view_model/enums/task_type.dart';
import 'package:todo_cubit/view_model/myCubits/cubit/note_cubit.dart';

import '../../model/task.dart';

class ArchiveTab extends StatelessWidget {
  const ArchiveTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //decoration: BoxDecoration(),
      body: Column(
        children: [
          Expanded(child: BlocBuilder<NoteCubit, NoteState>(
            builder: (context, state) {
              var cubit = NoteCubit.get(context);
              List<Task> list = cubit.tasksList
                  .where((element) => element.status == TasksType.archived)
                  .toList();
              return Visibility(
                visible: list.isNotEmpty,
                replacement: const Center(
                  child: Text('No Archived Tasks'),
                ),
                child: ListView.separated(
                  itemBuilder: (context, index) => TaskWidget(
                    task: list[index],
                  ),
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 12,
                  ),
                  itemCount: list.length,
                ),
              );
            },
          )),
        ],
      ),
    );
  }
}
