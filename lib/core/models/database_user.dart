class DatabaseUser {
  final String userId;
  final String firstName;
  final String lastName;
  final String mobileNumber;
  final int? activeEventID;

  DatabaseUser({
    required this.userId,
    required this.firstName,
    required this.lastName,
    required this.mobileNumber,
    this.activeEventID,
  });

  factory DatabaseUser.fromJson(Map<String, dynamic> json) {
    return DatabaseUser(
      userId: json['user_id'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      mobileNumber: json['mobile_number'],
      activeEventID: json['active_event_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user_id': userId,
      'first_name': firstName,
      'last_name': lastName,
      'mobile_number': mobileNumber,
      'active_event_id': activeEventID,
    };
  }

  bool isEqual(DatabaseUser other) {
    return userId == other.userId &&
        firstName == other.firstName &&
        lastName == other.lastName &&
        mobileNumber == other.mobileNumber &&
        activeEventID == other.activeEventID;
  }

  @override
  String toString() {
    return 'DatabaseUser(id: $userId, firstName: $firstName, lastName: $lastName, mobileNumber: $mobileNumber, activeEventID: $activeEventID)';
  }
}
