import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:reubro/app/routes/routes.dart';
import 'package:reubro/app/task_three/view/task_three.dart';

class SplashViewModel extends ChangeNotifier {
  SplashViewModel() {
    Timer(const Duration(seconds: 2), () {
      Routes.pushreplace(screen: const TaskThreeView());
    });
  }
}
