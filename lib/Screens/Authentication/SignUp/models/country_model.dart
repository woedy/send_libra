class CountryModel {
  String? message;
  List<Data>? data;
  Map<String, List<String>>? errors;


  CountryModel({this.message, this.data, this.errors});

  CountryModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }

    errors = json['errors'] != null ? _parseErrors(json['errors']) : null;

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



  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}




class Data {
  String? name;
  String? isoCode;
  String? prefix;

  Data({this.name, this.isoCode, this.prefix});

  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    isoCode = json['iso_code'];
    prefix = json['prefix'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['iso_code'] = this.isoCode;
    data['prefix'] = this.prefix;
    return data;
  }
}
