import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reubro/app/task_two/view_model/tasktwo_viewmodel.dart';

class PopUpButton extends StatelessWidget {
  final ActionsType type;
  final String data;
  final String? id;
  const PopUpButton({
    Key? key,
    required this.type,
    required this.data,
    this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = context.read<TaskTwoViewmodel>();
    check(context, data);
    return AlertDialog(
      contentPadding: const EdgeInsets.all(16.0),
      content: SizedBox(
        height: 150,
        child: Column(
          children: [
            const Text(
              "Add Task to your list",
              style: TextStyle(
                fontSize: 23,
              ),
            ),
            TextField(
              maxLines: 4,
              controller: provider.nameController,
              decoration: const InputDecoration(
                labelText: 'Add Task',
                hintText: 'eg. Musthak',
              ),
            ),
          ],
        ),
      ),
      actions: <Widget>[
        ElevatedButton(
            child: const Text('CANCEL'),
            onPressed: () {
              Navigator.pop(context);
            }),
        ElevatedButton(
          child: const Text('SUBMIT'),
          onPressed: () {
            if (type == ActionsType.add) {
              provider.addDataOnfirebae();
            } else {
              provider.updateData(id: id!);
            }
            Navigator.pop(context);
          },
        ),
      ],
    );
  }

  check(BuildContext context, String data) {
    if (type == ActionsType.edit) {
      context.read<TaskTwoViewmodel>().nameController.text = data;
    }
  }
}

enum ActionsType { add, edit }
