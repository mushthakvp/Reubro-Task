class TodoModel {
  final String task;

  TodoModel({required this.task});

  factory TodoModel.fromSnapshot(Map<String, dynamic> snapshot) {
    return TodoModel(
      task: snapshot["task"],
    );
  }

  Map<String, dynamic> toSnapshot() {
    return {
      "task": task,
    };
  }
}
