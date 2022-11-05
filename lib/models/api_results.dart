import 'api_categories.dart';

class Results {
  final String name;
  final String details;
  final String size;
  final String colour;
  final double price;
  final String mainImage;
  final int id;
   Category category;


  Results({
    required this.name,
    required this.details,
    required this.size,
    required this.colour,
    required this.price,
    required this.mainImage,
    required this.id,
    required this.category,
  });

  factory Results.fromJson(Map<String, dynamic> json) => Results(
      name:json["name"],
      details:json["details"],
      size:json["size"],
      colour:json["colour"],
      price:json["price"],
      mainImage:json["main_image"],
      id: json["id"],
     category: Category.fromJson(json["category"]),

      );
}
