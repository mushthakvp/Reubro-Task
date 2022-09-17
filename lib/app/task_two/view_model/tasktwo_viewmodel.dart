import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:reubro/app/task_two/firebase_service/firebase_service.dart';
import 'package:reubro/app/task_two/model/todo_model.dart';

class TaskTwoViewmodel extends ChangeNotifier {
  final nameController = TextEditingController();

  final todo = FirebaseFirestore.instance.collection('todo');

  addDataOnfirebae() async {
    final name = nameController.text.trim();

    final data = TodoModel(
      task: name,
    );

    await FirebaseService.addDataOnFirebase(data);
    nameController.clear();
  }

  deleteData({required String id}) {
    FirebaseFirestore.instance.collection("todo").doc(id).delete();
  }

  updateData({required String id}) async {
    final name = nameController.text.trim();

    final data = TodoModel(
      task: name,
    );
    await FirebaseFirestore.instance.collection("todo").doc(id).set(data.toSnapshot());
    nameController.clear();
  }
}
