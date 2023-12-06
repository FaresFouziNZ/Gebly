class Order {
  final int? orderID;
  final String userID;
  final int eventID;
  final int total;
  final String activeEventID;
  final DateTime createdAt;

  Order({
    required this.orderID,
    required this.userID,
    required this.eventID,
    required this.total,
    required this.activeEventID,
    required this.createdAt,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      orderID: json['order_id'],
      userID: json['user_id'],
      eventID: json['event_id'],
      total: json['total'],
      activeEventID: json['active_event_id'],
      createdAt: DateTime.parse(json['created_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'order_id': orderID,
      'user_id': userID,
      'event_id': eventID,
      'total': total,
      'active_event_id': activeEventID,
      'created_at': createdAt.toIso8601String(),
    };
  }

  bool isEqual(Order other) {
    return orderID == other.orderID &&
        userID == other.userID &&
        eventID == other.eventID &&
        total == other.total &&
        activeEventID == other.activeEventID &&
        createdAt == other.createdAt;
  }

  @override
  String toString() {
    return 'Order{order_id: $orderID, user_id: $userID, event_id: $eventID, total: $total, active_event_id: $activeEventID, created_at: $createdAt}';
  }
}
