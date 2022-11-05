import 'api_results.dart';

class ApiPagination {
  final int? count;
  final int? totalPages;
  final int? perPage;
  final int? currentPage;
   List<Results>? result;

  ApiPagination({
    required this.count,
    required this.totalPages,
    required this.perPage,
    required this.currentPage,
    required this.result,
  });

/*  var list = parsedJson['images'] as List;//returns List<dynamic>
  List<Image> imagesList = list.map((i) => Image.fromJson(i)).toList();*/

  factory ApiPagination.fromJson(Map<String, dynamic> json) {

    List<Results> resultList = (json["results"] as List).map((i) => Results.fromJson(i)).toList();

    return ApiPagination(
      count: json["count"],
      totalPages: json["total_page"],
      perPage: json["per_page"],
      currentPage: json["current_page"],
      result: resultList,
    );

  }
}
