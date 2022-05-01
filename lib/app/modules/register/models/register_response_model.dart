class RegisterModelResponse {
  String? msg;

  RegisterModelResponse({this.msg});

  RegisterModelResponse.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['msg'] = msg;
    return data;
  }
}
