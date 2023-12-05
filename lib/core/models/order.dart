class Order {
  final int orderID;
  final String userID;
  final int eventID;
  final int total;
  final DateTime createdAt;

  Order({
    required this.orderID,
    required this.userID,
    required this.eventID,
    required this.total,
    required this.createdAt,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      orderID: json['order_id'],
      userID: json['user_id'],
      eventID: json['event_id'],
      total: json['total'],
      createdAt: DateTime.parse(json['created_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'order_id': orderID,
      'user_id': userID,
      'event_id': eventID,
      'total': total,
      'created_at': createdAt.toIso8601String(),
    };
  }

  bool isEqual(Order other) {
    return orderID == other.orderID &&
        userID == other.userID &&
        eventID == other.eventID &&
        total == other.total &&
        createdAt == other.createdAt;
  }

  @override
  String toString() {
    return 'Order(orderID: $orderID, userID: $userID, eventID: $eventID, total: $total, createdAt: $createdAt)';
  }
}
