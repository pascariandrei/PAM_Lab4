class Category {
  final String name;
  final String icon;
  final int id;

  Category({required this.name, required this.icon, required this.id});

  factory Category.fromJson(Map<String, dynamic> json) =>
      Category(
          name: json["name"],
          icon: json["icon"],
          id: json["id"]);
}
