import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_cubit/view/components/task_widget.dart';
import 'package:todo_cubit/view_model/myCubits/cubit/note_cubit.dart';

import '../../model/task.dart';
import '../../view_model/enums/task_type.dart';
import '../../view_model/utils/colors.dart';

class TasksTab extends StatelessWidget {
  const TasksTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //decoration: BoxDecoration(),
      body: BlocBuilder<NoteCubit, NoteState>(
        builder: (context, state) {
          var cubit = NoteCubit.get(context);
          List<Task> list = cubit.tasksList
              .where((element) => element.status == TasksType.all)
              .toList();
          return Visibility(
            visible: list.isNotEmpty,
            replacement: Center(
              child: Image.asset(
                'assets/images/empty.png',
                width: 310,
                height: 310,
              ),
            ),
            child: ListView.separated(
              shrinkWrap: true,
              physics: const AlwaysScrollableScrollPhysics(),
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
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              NoteCubit cubit = NoteCubit.get(context);
              return BlocConsumer<NoteCubit, NoteState>(
                listener: (context, state) {},
                builder: (context, state) {
                  return AlertDialog(
                    scrollable: true,
                    title: const Text(
                      ' Your to-do ',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                    backgroundColor: AppColors.primaryColor,
                    content: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextFormField(
                          controller: cubit.titleController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: AppColors.seconderColor,
                                ),
                                borderRadius: BorderRadius.circular(15)),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: AppColors.seconderColor,
                                ),
                                borderRadius: BorderRadius.circular(15)),
                            disabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: AppColors.seconderColor,
                                ),
                                borderRadius: BorderRadius.circular(15)),
                            hintText: 'Title',
                            label: const Text('Title'),
                            labelStyle: const TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          onTap: () {
                            showDatePicker(
                              builder: (context, child) {
                                return Theme(
                                  data: Theme.of(context).copyWith(
                                    colorScheme: ColorScheme.light(
                                      primary: AppColors
                                          .seconderColor, // header background color
                                      onPrimary:
                                          Colors.black, // header text color
                                      onSurface:
                                          AppColors.black, // body text color
                                    ),
                                    textButtonTheme: TextButtonThemeData(
                                      style: TextButton.styleFrom(
                                        foregroundColor: AppColors
                                            .seconderColor, // button text color
                                      ),
                                    ),
                                  ),
                                  child: child!,
                                );
                              },
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime.now(),
                              lastDate: DateTime(2025),
                            ).then(
                              (value) {
                                cubit.dateController.text =
                                    "${value!.day}-${value.month}-${value.year}";
                              },
                            );
                          },
                          controller: cubit.dateController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: AppColors.seconderColor,
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: AppColors.seconderColor,
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: AppColors.seconderColor,
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            // focusedBorder: OutlineInputBorder(
                            //   borderSide: BorderSide(
                            //     color: AppColors.seconderColor,
                            //   ),
                            //   borderRadius: BorderRadius.circular(15),
                            // ),
                            label: const Text(
                              'Date',
                            ),
                            labelStyle: const TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          keyboardType: TextInputType.none,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          onTap: () {
                            //print('in on tap in date ');
                            showTimePicker(
                              builder: (context, child) {
                                return Theme(
                                  data: Theme.of(context).copyWith(
                                    colorScheme: ColorScheme.light(
                                      primary: AppColors
                                          .seconderColor, // header background color
                                      onPrimary:
                                          Colors.black, // header text color
                                      onSurface:
                                          AppColors.black, // body text color
                                    ),
                                    textButtonTheme: TextButtonThemeData(
                                      style: TextButton.styleFrom(
                                        foregroundColor: AppColors
                                            .seconderColor, // button text color
                                      ),
                                    ),
                                  ),
                                  child: child!,
                                );
                              },
                              context: context,
                              initialTime: TimeOfDay.now(),
                            ).then(
                              (value) {
                                cubit.timeController.text =
                                    "${value!.hour}:${value.minute}";
                              },
                            );
                          },
                          controller: cubit.timeController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: AppColors.seconderColor,
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: AppColors.seconderColor,
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: AppColors.seconderColor,
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            // focusedBorder: OutlineInputBorder(
                            //   borderSide: BorderSide(
                            //     color: AppColors.seconderColor,
                            //   ),
                            //   borderRadius: BorderRadius.circular(15),
                            // ),
                            label: const Text(
                              'Time',
                            ),
                            labelStyle: const TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          keyboardType: TextInputType.none,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: SizedBox(
                                height: 50,
                                child: Material(
                                  color: AppColors.seconderColor,
                                  borderRadius: BorderRadius.circular(25),
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: AppColors.seconderColor,
                                    ),
                                    onPressed: () {
                                      // navigation pop
                                      Navigator.pop(context);
                                    },
                                    child: const Text(
                                      'Cancel',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Material(
                                color: AppColors.seconderColor,
                                borderRadius: BorderRadius.circular(25),
                                child: SizedBox(
                                  height: 50,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: AppColors.seconderColor,
                                    ),
                                    onPressed: () {
                                      cubit.addTask();

                                      Navigator.pop(context);
                                      cubit.dateController.clear();
                                      cubit.titleController.clear();
                                      cubit.timeController.clear();
                                    },
                                    child: const Text(
                                      'Ok',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  );
                },
              );
            },
          );
        },
        backgroundColor: AppColors.seconderColor,
        shape: CircleBorder(
            side: BorderSide(
          color: AppColors.seconderColor,
          width: 1.8,
        )),
        child: Icon(
          CupertinoIcons.add,
          color: AppColors.primaryColor,
          size: 30,
        ),
      ),
    );
  }
}
