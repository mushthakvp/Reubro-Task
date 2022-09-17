import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reubro/app/task_two/view_model/tasktwo_viewmodel.dart';
import '../../main.dart';
import '../task_one/view_model/task_viewmodel.dart';
import '../task_three/view_model/splash_viewmodel.dart';
import '../task_three/view_model/task_three_viewmodel.dart';

class Providers {
  static Widget providers() {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<TaskOneViewModel>(create: (context) => TaskOneViewModel()),
        ChangeNotifierProvider<TaskTwoViewmodel>(create: (context) => TaskTwoViewmodel()),
        ChangeNotifierProvider<TaskThreeViewModel>(create: (context) => TaskThreeViewModel()),
        ChangeNotifierProvider<SplashViewModel>(create: (context) => SplashViewModel()),
      ],
      child: const MyApp(),
    );
  }
}
