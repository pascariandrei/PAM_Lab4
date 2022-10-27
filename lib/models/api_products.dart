class ApiPr {
  final int count;
  final int totalpages;
  final int perpage;
  final int currentpage;

  ApiPr({
    required this.count,
    required this.totalpages,
    required this.perpage,
    required this.currentpage,
  });

  factory ApiPr.fromJson(Map<String, dynamic> json) => ApiPr(
        count: json["count"],
        totalpages: json["total_pages"],
        perpage: json["per_pages"],
        currentpage: json["current_page"],
      );
}
