import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_cubit/view_model/utils/colors.dart';

import 'archive_tab.dart';
import 'done-tab.dart';
import 'task_tab.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Hi, Esraa',
            style: TextStyle(
              color: Colors.black,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: false,
          backgroundColor: AppColors.primaryColor,
          bottom: TabBar(
              indicatorColor: AppColors.seconderColor,
              indicatorSize: TabBarIndicatorSize.tab,
              tabs: const [
                Tab(
                 
                  child: Text(
                    'Tasks',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    'Done',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    'Archive',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ]),
        ),
        //body 
        body: Container(
          padding: const EdgeInsets.all(15),
          height: double.infinity,
          width: double.infinity,
          child: const TabBarView(children: [
            TasksTab(),
            DoneTab(),
            ArchiveTab(),
          ]),
        ),
      ),
    );
  }
}
