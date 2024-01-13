class SignUpBody{
  String name;
  String surname;  
  String phone;
  String email;
  String password;

  SignUpBody({
    required this.name,
    required this.surname,    
    required this.phone,
    required this.email,
    required this.password,
  
  });

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = <String, dynamic>{};
    data["name"] = name;
    data["surname"] = surname;    
    data["phone_number"] = phone;
    data["email"] = email;
    data["password"] = password;

    return data;
  }
}