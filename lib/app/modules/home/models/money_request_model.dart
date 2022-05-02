class MoneyRequest {
  int? value;
  String? description;

  MoneyRequest({this.value, this.description});

  MoneyRequest.fromJson(Map<String, dynamic> json) {
    value = json['value'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['value'] = value;
    data['description'] = description;
    return data;
  }
}
