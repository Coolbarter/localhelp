class User {
  final String id;
  final String name;
  final String email;
  final String? profileImage;
  final String userType; // 'guide' or 'tourist'
  final DateTime createdAt;

  User({
    required this.id,
    required this.name,
    required this.email,
    this.profileImage,
    required this.userType,
    required this.createdAt,
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'email': email,
    'profileImage': profileImage,
    'userType': userType,
    'createdAt': createdAt.toIso8601String(),
  };

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json['id'],
    name: json['name'],
    email: json['email'],
    profileImage: json['profileImage'],
    userType: json['userType'],
    createdAt: DateTime.parse(json['createdAt']),
  );
}
