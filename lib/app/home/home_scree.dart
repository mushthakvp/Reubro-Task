import 'package:flutter/material.dart';
import 'package:reubro/app/task_two/view/tasktwo_screen.dart';
import '../routes/routes.dart';
import '../task_one/view/taskone_view.dart';
import '../task_three/view/task_spleesh.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Reubro"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () {
                Routes.push(screen: const TaskOneView());
              },
              child: const Text("Task One Api"),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Routes.push(screen: const TaskTwoView());
            },
            child: const Text("Task Two FireBase"),
          ),
          ElevatedButton(
            onPressed: () {
              Routes.push(screen: const TaskSplash());
            },
            child: const Text("Task three Bmicalculator"),
          ),
          ElevatedButton(
            onPressed: () {
              Routes.push(screen: const TaskOneView());
            },
            child: const Text("GitHub Link"),
          ),
        ],
      ),
    );
  }
}
