class UserModel {
  int id;
  String name;
  String surname;
  String email;
  String phone; 
  String created;

  UserModel({
    required this.id,
    required this.name,
    required this.surname,
    required this.email,
    required this.phone,
    required this.created,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json["id"],
      email: json["email"],
      name: json["name"],
      surname: json["surname"],
      phone: json["phone_number"].toString(),
      created: json["created_at"],
    );
  }
}
