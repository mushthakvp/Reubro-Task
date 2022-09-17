import 'dart:developer';
import 'package:flutter/cupertino.dart';
import '../api/api_service.dart';
import '../model/model.dart';

class TaskOneViewModel extends ChangeNotifier {
  late PageController pageController;

  TaskOneViewModel() {
    getImage();
    pageController = PageController(viewportFraction: 0.8);
  }

  int activePage = 1;
  carouselPageChange(int page) {
    activePage = page;
  }

  //api images

  List<Result> imagesList = [];

  getImage() async {
    List data = await ApiService.getcarouselDta();

    if (data.first == 200) {
      imagesList.addAll(data[1]);
    } else if (data.first == 404) {
      log("Client error");
    } else if (data.first == 500) {
      log("Server error");
    }
    notifyListeners();
  }
}
