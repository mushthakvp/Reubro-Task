import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../api/endpointes.dart';
import '../view_model/task_viewmodel.dart';

class TaskOneView extends StatelessWidget {
  const TaskOneView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Task One"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Consumer<TaskOneViewModel>(
            builder: (context, value, _) {
              return value.imagesList.isEmpty
                  ? const SizedBox(
                      height: 200,
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    )
                  : LimitedBox(
                      maxHeight: 200,
                      child: PageView.builder(
                        itemCount: value.imagesList.length,
                        pageSnapping: true,
                        controller: value.pageController,
                        itemBuilder: (context, index) {
                          final data = value.imagesList[index];
                          return Container(
                            height: 200,
                            width: double.infinity,
                            margin: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage("${ApiEndpointes.imageUppendUrl}${data.backdropPath}"),
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        },
                      ),
                    );
            },
          ),
        ],
      ),
    );
  }
}
