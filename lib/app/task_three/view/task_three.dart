import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reubro/app/home/home_scree.dart';
import 'package:reubro/app/routes/routes.dart';
import 'package:reubro/app/task_three/view/widgets/radiobutton.dart';

import '../view_model/task_three_viewmodel.dart';

class TaskThreeView extends StatelessWidget {
  const TaskThreeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = context.read<TaskThreeViewModel>();
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(onPressed: (() {
          Routes.pushAndRemove(screen: const HomeScreen());
        })),
        centerTitle: true,
        title: const Text("BMI Calculator"),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 14),
            child: Row(
              children: const [
                RadioButtons(index: 0, title: "Men"),
                SizedBox(width: 15),
                RadioButtons(index: 1, title: "Woman"),
              ],
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            "Your height in Cm :",
            style: TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 10),
          TextField(
            controller: provider.height,
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              hintText: "your height",
              filled: true,
              fillColor: Colors.blue.withOpacity(.2),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            "Your Weight in Kg :",
            style: TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 10),
          TextField(
            controller: provider.weight,
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              hintText: "your weight",
              filled: true,
              fillColor: Colors.blue.withOpacity(.2),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          const SizedBox(height: 15),
          SizedBox(
            height: 60,
            child: ElevatedButton(
              onPressed: () {
                provider.calculateBmi();
              },
              child: const Text("SUBMIT"),
            ),
          ),
          const SizedBox(height: 40),
          Center(
            child: Consumer<TaskThreeViewModel>(builder: (context, value, _) {
              return Text(
                "Your BMI is : ${value.bmiRes.toStringAsFixed(2)}",
                style: const TextStyle(
                  fontSize: 25,
                ),
              );
            }),
          ),
          const SizedBox(height: 20),
          Consumer<TaskThreeViewModel>(builder: (context, value, _) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Normal", style: TextStyle(fontSize: 20, color: value.bmiRes < 25 ? Colors.green : Colors.black)),
                Text(
                  "18.5 - 24.9",
                  style: TextStyle(fontSize: 20, color: value.bmiRes < 25 ? Colors.green : Colors.black),
                ),
              ],
            );
          }),
          const SizedBox(height: 10),
          Consumer<TaskThreeViewModel>(builder: (context, value, _) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Over Weight", style: TextStyle(fontSize: 20, color: value.bmiRes >= 25 ? Colors.red : Colors.black)),
                Text(
                  "25.0 - 29.9",
                  style: TextStyle(fontSize: 20, color: provider.bmiRes >= 25 ? Colors.red : Colors.black),
                ),
              ],
            );
          }),
        ],
      ),
    );
  }
}
