import 'package:dio/dio.dart';
import 'package:reubro/app/task_one/api/endpointes.dart';
import '../model/model.dart';

class ApiService {
  static Future<List> getcarouselDta() async {
    try {
      Response respones = await Dio().get(ApiEndpointes.carouselUrl);

      if (respones.statusCode == 200) {
        CarouselModel data = CarouselModel.fromJson(respones.data);
        return [200, data.results];
      } else {
        return [404];
      }
    } catch (e) {
      return [500];
    }
  }
}
