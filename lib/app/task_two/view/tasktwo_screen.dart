import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reubro/app/task_two/firebase_service/firebase_service.dart';
import 'package:reubro/app/task_two/model/todo_model.dart';
import 'package:reubro/app/task_two/view/widgets/popup.dart';
import 'package:reubro/app/task_two/view_model/tasktwo_viewmodel.dart';

class TaskTwoView extends StatelessWidget {
  const TaskTwoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = context.read<TaskTwoViewmodel>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Firebase"),
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => const PopUpButton(
                  type: ActionsType.add,
                  data: '',
                ),
              );
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: StreamBuilder(
        stream: provider.todo.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
          List<TodoModel> list = FirebaseService.convertToList(streamSnapshot);
          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: list.length,
            itemBuilder: (context, index) {
              final id = streamSnapshot.data!.docs[index];
              final data = list[index];
              return Row(
                children: [
                  Expanded(
                    child: Text(
                      data.task,
                      maxLines: 3,
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      provider.deleteData(id: id.id);
                    },
                    icon: const Icon(Icons.delete),
                  ),
                  IconButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => PopUpButton(
                          type: ActionsType.edit,
                          data: data.task,
                          id: id.id,
                        ),
                      );
                    },
                    icon: const Icon(Icons.edit),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
