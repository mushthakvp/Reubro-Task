import 'package:flutter/cupertino.dart';

class TaskThreeViewModel extends ChangeNotifier {
  final height = TextEditingController();
  final weight = TextEditingController();
  int rindex = 0;
  changeRadioButton({required int index}) {
    rindex = index;
    notifyListeners();
  }

  double bmiRes = 0;
  calculateBmi() {
    int heightInt = int.parse(height.text);
    int weightInt = int.parse(weight.text);
    double res = (heightInt / 100);
    double bmi = weightInt / (res * res);
    bmiRes = bmi;
    notifyListeners();
  }
}
