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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["name"] = this.name;
    data["surname"] = this.surname;    
    data["phone_number"] = this.phone;
    data["email"] = this.email;
    data["password"] = this.password;
    return data;
  }
}