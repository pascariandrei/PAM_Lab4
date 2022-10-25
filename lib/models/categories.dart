class Categories {
  final String title;
  final String icon;

  Categories({
    this.title = "",
    this.icon = ""});

  factory Categories.fromJson(Map<String, dynamic> json) => Categories(title: json["title"], icon: json["icon"]);
}
