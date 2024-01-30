import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_cubit/view_model/myCubits/cubit/note_cubit.dart';

import 'view/screens/home_page.dart';
import 'view_model/myCubits/bloc_observer.dart';

void main() {
  Bloc.observer = MyBlocObserver();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<NoteCubit>(
          create: (context) {
            return NoteCubit();
          },
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MyHomePage(),
      ),
    );
  }
}
