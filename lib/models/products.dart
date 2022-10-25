class Products {
  final String cover;
  final String title;
  final String subtitle;
  final int price;
  final String currency;

  Products(
      {required this.cover,
      required this.title,
      required this.subtitle,
      required this.price,
      required this.currency
      });

factory Products.fromJson(Map<String, dynamic> json) => Products(
        cover: json["cover"],
        title: json["title"],
        subtitle: json["sub_title"],
        price: json["price"],
        currency: json["currency"],
      );
}
