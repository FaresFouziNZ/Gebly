import 'package:supabase_flutter/supabase_flutter.dart';

class Order {
  final int? orderID;
  final String userID;
  final int eventID;
  final double orderTotal;
  final DateTime? createdAt;

  Order({
    this.orderID,
    required this.userID,
    required this.eventID,
    required this.orderTotal,
    this.createdAt,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      orderID: json['order_id'],
      userID: json['user_id'],
      eventID: json['event_id'],
      orderTotal: toDouble(json['order_total'])!,
      createdAt: DateTime.parse(json['created_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'order_id': orderID,
      'user_id': userID,
      'event_id': eventID,
      'order_total': orderTotal,
      'created_at': createdAt?.toIso8601String(),
    };
  }

  bool isEqual(Order other) {
    return orderID == other.orderID &&
        userID == other.userID &&
        eventID == other.eventID &&
        orderTotal == other.orderTotal &&
        createdAt == other.createdAt;
  }

  @override
  String toString() {
    return 'Order{order_id: $orderID, user_id: $userID, event_id: $eventID, total: $orderTotal, created_at: $createdAt}';
  }
}
