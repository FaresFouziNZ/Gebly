class Restaurant {
  final int id;
  final String name;
  final String logoUrl;
  final double longitude;
  final double latitude;
  final String openHours;
  final DateTime? createdAt;

  Restaurant({
    required this.id,
    required this.name,
    required this.logoUrl,
    required this.longitude,
    required this.latitude,
    required this.openHours,
    this.createdAt,
  });

  factory Restaurant.fromJson(Map<String, dynamic> json) {
    return Restaurant(
      id: json['resturant_id'],
      name: json['name'],
      logoUrl: json['logo_url'],
      longitude: json['longitude'],
      latitude: json['latitude'],
      openHours: json['open_hours'],
      createdAt: DateTime.parse(json['created_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'resturant_id': id,
      'name': name,
      'logo_url': logoUrl,
      'longitude': longitude,
      'latitude': latitude,
      'open_hours': openHours,
      'created_at': createdAt?.toIso8601String(),
    };
  }

  bool isEqual(Restaurant other) {
    return id == other.id &&
        name == other.name &&
        logoUrl == other.logoUrl &&
        longitude == other.longitude &&
        latitude == other.latitude &&
        openHours == other.openHours &&
        createdAt == other.createdAt;
  }

  @override
  String toString() {
    return 'Restaurant(id: $id, name: $name, logoUrl: $logoUrl, longitude: $longitude, latitude: $latitude, openHours: $openHours, createdAt: $createdAt)';
  }
}
