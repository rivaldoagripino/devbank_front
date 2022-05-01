class RegisterModelRequest {
  String? email;
  String? username;
  String? firstName;
  String? lastName;
  String? password;

  RegisterModelRequest(
      {this.email,
      this.username,
      this.firstName,
      this.lastName,
      this.password});

  RegisterModelRequest.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    username = json['username'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['username'] = username;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['password'] = password;
    return data;
  }
}
