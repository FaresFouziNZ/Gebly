class Payment {
  final String id;
  final String userID;
  final String name;
  final String iban;
  final DateTime createdAt;

  Payment({
    required this.id,
    required this.userID,
    required this.name,
    required this.iban,
    required this.createdAt,
  });

  factory Payment.fromJson(Map<String, dynamic> json) {
    return Payment(
      id: json['id'],
      userID: json['user_id'],
      name: json['name'],
      iban: json['iban'],
      createdAt: DateTime.parse(json['created_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userID,
      'name': name,
      'iban': iban,
      'created_at': createdAt.toIso8601String(),
    };
  }

  bool isEqual(Payment other) {
    return id == other.id &&
        userID == other.userID &&
        name == other.name &&
        iban == other.iban &&
        createdAt == other.createdAt;
  }

  @override
  String toString() {
    return 'Payment(id: $id, userID: $userID, name: $name, iban: $iban, createdAt: $createdAt)';
  }
}
