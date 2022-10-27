import 'package:flutter_shop/models/categories.dart';

import 'api_categories.dart';

class Results {
  final String name;
  final String details;
  final String size;
  final String colour;
  final double price;
  final String mainimage;
  final int id;
   Category category;


  Results({
    required this.name,
    required this.details,
    required this.size,
    required this.colour,
    required this.price,
    required this.mainimage,
    required this.id,
    required this.category,
  });

  factory Results.fromJson(Map<String, dynamic> json) => Results(
      name:json["name"],
      details:json["details"],
      size:json["size"],
      colour:json["colour"],
      price:json["price"],
      mainimage:json["main_image"],
      id: json["id"],
     category: Category.fromJson(json["category"]),

      );
}
