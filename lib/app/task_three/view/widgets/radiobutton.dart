import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../view_model/task_three_viewmodel.dart';

class RadioButtons extends StatelessWidget {
  final int index;
  final String title;
  const RadioButtons({
    Key? key,
    required this.index,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = context.read<TaskThreeViewModel>();
    return Selector<TaskThreeViewModel, int>(
      selector: (BuildContext context, TaskThreeViewModel obj) => obj.rindex,
      builder: (context, int value, _) {
        return Expanded(
          child: SizedBox(
            height: 60,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: index == value ? Colors.blue : Colors.white),
              onPressed: () {
                provider.changeRadioButton(index: index);
              },
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 20,
                  color: index != value ? Colors.blue : Colors.white,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
