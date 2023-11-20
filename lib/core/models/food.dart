class Food {
  final String name;
  final String image;
  final String description;
  final double price;
  final double rating;
  final String restaurant;
  final String category;

  Food({
    required this.name,
    required this.image,
    required this.description,
    required this.price,
    required this.rating,
    required this.restaurant,
    required this.category,
  });

  factory Food.fromJson(Map<String, dynamic> json) {
    return Food(
      name: json['name'],
      image: json['image'],
      description: json['description'],
      price: json['price'],
      rating: json['rating'],
      restaurant: json['restaurant'],
      category: json['category'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'image': image,
      'description': description,
      'price': price,
      'rating': rating,
      'restaurant': restaurant,
      'category': category,
    };
  }
}
