class VerifyEmailModel {
  String? message;
  Data? data;
  Map<String, List<String>>? errors;

  VerifyEmailModel({this.message, this.data, this.errors});

  factory VerifyEmailModel.fromJson(Map<String, dynamic> json) {
    return VerifyEmailModel(
      message: json['message'],
      data: json['data'] != null ? Data.fromJson(json['data']) : null,
      errors: json['errors'] != null ? _parseErrors(json['errors']) : null,
    );
  }

  static Map<String, List<String>> _parseErrors(Map<String, dynamic> errorData) {
    Map<String, List<String>> errors = {};
    errorData.forEach((key, value) {
      if (value is List) {
        errors[key] = List<String>.from(value);
      } else if (value is String) {
        errors[key] = [value];
      }
    });
    return errors;
  }
}

class Data {
  String? token;
  String? pin;

  Data({this.token, this.pin});

  Data.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    pin = json['pin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['pin'] = this.pin;
    return data;
  }
}
