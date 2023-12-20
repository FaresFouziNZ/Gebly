import 'package:supabase_flutter/supabase_flutter.dart';

class Event {
  final int? id;
  final String bossID;
  final int restaurantID;
  final DateTime? createdAt;
  final DateTime? deadline;
  final String status;
  final bool isShare;
  final double totalPrice;
  final String code;

  Event({
    this.id,
    required this.bossID,
    required this.restaurantID,
    this.createdAt,
    this.deadline,
    required this.status,
    required this.isShare,
    required this.totalPrice,
    required this.code,
  });

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      id: json['event_id'],
      bossID: json['boss_id'],
      restaurantID: json['restaurant_id'],
      createdAt: DateTime.parse(json['created_at']),
      deadline: DateTime.parse(json['deadline'] ?? DateTime.now().toIso8601String()),
      status: json['status'],
      isShare: json['is_share'],
      totalPrice: toDouble(json['total_price'])!,
      code: json['code'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'event_id': id,
      'boss_id': bossID,
      'restaurant_id': restaurantID,
      'created_at': createdAt?.toIso8601String(),
      'deadline': deadline?.toIso8601String(),
      'status': status,
      'is_share': isShare,
      'total_price': totalPrice,
      'code': code,
    };
  }

  bool isEqual(Event other) {
    return id == other.id &&
        bossID == other.bossID &&
        restaurantID == other.restaurantID &&
        createdAt == other.createdAt &&
        deadline == other.deadline &&
        status == other.status &&
        isShare == other.isShare &&
        totalPrice == other.totalPrice &&
        code == other.code;
  }

  @override
  String toString() {
    return 'Event(id: $id, bossID: $bossID, restaurantID: $restaurantID, createdAt: $createdAt, deadline: $deadline, status: $status, isShare: $isShare, totalPrice: $totalPrice, code: $code)';
  }
}
