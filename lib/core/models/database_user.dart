class DatabaseUser {
  final String id;
  final String firstName;
  final String lastName;
  final String mobileNumber;

  DatabaseUser({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.mobileNumber,
  });

  factory DatabaseUser.fromJson(Map<String, dynamic> json) {
    return DatabaseUser(
      id: json['id'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      mobileNumber: json['mobile_number'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'first_name': firstName,
      'last_name': lastName,
      'mobile_number': mobileNumber,
    };
  }

  bool isEqual(DatabaseUser other) {
    return id == other.id &&
        firstName == other.firstName &&
        lastName == other.lastName &&
        mobileNumber == other.mobileNumber;
  }

  @override
  String toString() {
    return 'DatabaseUser(id: $id, firstName: $firstName, lastName: $lastName, mobileNumber: $mobileNumber)';
  }
}
