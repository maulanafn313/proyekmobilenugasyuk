class User {
  final String id;
  final String name;
  final String email;
  final String address;
  final String city;
  final String province;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.address,
    required this.city,
    required this.province,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      address: json['address'],
      city: json['city'],
      province: json['province'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'address': address,
      'city': city,
      'province': province,
    };
  }
}
