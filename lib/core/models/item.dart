class Item {
  final int id;
  final String name;
  final double price;
  final String photoUrl;
  final int restaurantID;
  final DateTime? createdAt;

  Item({
    required this.id,
    required this.name,
    required this.price,
    required this.photoUrl,
    required this.restaurantID,
    this.createdAt,
  });

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      id: json['item_id'],
      name: json['name'],
      price: json['price'] + 0.0,
      photoUrl: json['photo_url'] ?? "",
      restaurantID: json['restaurant_id'],
      createdAt: DateTime.parse(json['created_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'item_id': id,
      'name': name,
      'price': price,
      'photo_url': photoUrl,
      'restaurant_id': restaurantID,
      'created_at': createdAt?.toIso8601String(),
    };
  }

  bool isEqual(Item other) {
    return id == other.id &&
        name == other.name &&
        price == other.price &&
        photoUrl == other.photoUrl &&
        restaurantID == other.restaurantID &&
        createdAt == other.createdAt;
  }

  @override
  String toString() {
    return 'Item(id: $id, name: $name, price: $price, photoUrl: $photoUrl, restaurantID: $restaurantID, createdAt: $createdAt)';
  }
}
