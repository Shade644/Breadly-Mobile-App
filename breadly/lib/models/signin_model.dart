class SignInBody{
  String password;
  String username;
  SignInBody({
    required this.password,
    required this.username,    
  });

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = <String, dynamic>{};
    data["username"] = username;     
    data["password"] = password;   
    return data;
  }
}