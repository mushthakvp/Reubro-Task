import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../model/todo_model.dart';

class FirebaseService {
  static List<TodoModel> convertToList(AsyncSnapshot<QuerySnapshot> snapshot) {
    if (snapshot.hasData) {
      List<TodoModel> newlist = snapshot.data!.docs.map((convert) {
        return TodoModel.fromSnapshot(convert.data() as Map<String, dynamic>);
      }).toList();

      return newlist;
    } else {
      return [];
    }
  }

  static addDataOnFirebase(TodoModel data) {
    FirebaseFirestore.instance.collection("todo").add(data.toSnapshot());
  }
}
