class CarouselModel {
  CarouselModel({
    required this.results,
  });

  List<Result> results;

  factory CarouselModel.fromJson(Map<String, dynamic> json) => CarouselModel(
        results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
      };
}

class Result {
  Result({
    required this.backdropPath,
    required this.posterPath,
  });

  String backdropPath;
  String posterPath;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        backdropPath: json["backdrop_path"],
        posterPath: json["poster_path"],
      );

  Map<String, dynamic> toJson() => {
        "backdrop_path": backdropPath,
        "poster_path": posterPath,
      };
}
