class ExtractResponse {
  String? initialBalance;
  String? finalBalance;
  List<Extract>? extract;

  ExtractResponse({this.initialBalance, this.finalBalance, this.extract});

  ExtractResponse.fromJson(Map<String, dynamic> json) {
    initialBalance = json['Initial_balance'];
    finalBalance = json['Final_balance'];
    if (json['Extract'] != null) {
      extract = <Extract>[];
      json['Extract'].forEach((v) {
        extract!.add(Extract.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Initial_balance'] = initialBalance;
    data['Final_balance'] = finalBalance;
    if (extract != null) {
      data['Extract'] = extract!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Extract {
  String? date;
  String? value;
  String? type;
  String? description;

  Extract({this.date, this.value, this.type, this.description});

  Extract.fromJson(Map<String, dynamic> json) {
    date = json['Date'];
    value = json['Value'];
    type = json['Type'];
    description = json['Description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['Date'] = date;
    data['Value'] = value;
    data['Type'] = type;
    data['Description'] = description;
    return data;
  }
}
