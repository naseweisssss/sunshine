import 'dart:convert';
////     final data = dataFromJson(jsonString);

Parameter dataFromJson(String str) => Parameter.fromJson(json.decode(str));

String dataToJson(Parameter data) => json.encode(data.toJson());

class Parameter {
  Ts? ts;

  Parameter({this.ts});

  Parameter.fromJson(Map<String, dynamic> json) {
    ts = json['TS'] != null ? new Ts.fromJson(json['TS']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.ts != null) {
      data['TS'] = this.ts!.toJson();
    }
    return data;
  }
}

class Ts {
  double? january;
  double? february;
  double? march;
  double? april;
  double? may;

  Ts({this.january,
    this.february,
    this.march,
    this.april,
    this.may,
  });

  Ts.fromJson(Map<String, dynamic> json) {
    january = json['202001'];
    february = json['202002'];
    march = json['202003'];
    april = json['202004'];
    may = json['202005'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['202001'] = this.january;
    data['202002'] = this.february;
    data['202003'] = this.march;
    data['202004'] = this.april;
    data['202005'] = this.may;

    return data;
  }
}
