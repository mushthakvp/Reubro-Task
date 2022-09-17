import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reubro/app/task_three/view_model/splash_viewmodel.dart';

class TaskSplash extends StatelessWidget {
  const TaskSplash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<SplashViewModel>(
        builder: (context, value, _) {
          return const Center(
            child: Text(
              "BMI CALCULATOR",
              style: TextStyle(fontSize: 24),
            ),
          );
        },
      ),
    );
  }
}
