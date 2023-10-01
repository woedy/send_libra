class AddReceiverModel {
  String? message;
  List<Data>? data;

  AddReceiverModel({this.message, this.data});

  AddReceiverModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
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
  String? beneficiaryId;
  String? name;
  String? fname;
  String? mname;
  String? lname;
  String? nickname;
  String? email;
  String? telephone;
  String? mobile;
  String? gender;
  String? avatar;
  String? avatarContent;
  String? country;
  String? countryIsoCode;
  String? importId;

  Data(
      {this.beneficiaryId,
        this.name,
        this.fname,
        this.mname,
        this.lname,
        this.nickname,
        this.email,
        this.telephone,
        this.mobile,
        this.gender,
        this.avatar,
        this.avatarContent,
        this.country,
        this.countryIsoCode,
        this.importId});

  Data.fromJson(Map<String, dynamic> json) {
    beneficiaryId = json['beneficiary_id'];
    name = json['name'];
    fname = json['fname'];
    mname = json['mname'];
    lname = json['lname'];
    nickname = json['nickname'];
    email = json['email'];
    telephone = json['telephone'];
    mobile = json['mobile'];
    gender = json['gender'];
    avatar = json['avatar'];
    avatarContent = json['avatar_content'];
    country = json['country'];
    countryIsoCode = json['country_iso_code'];
    importId = json['import_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['beneficiary_id'] = this.beneficiaryId;
    data['name'] = this.name;
    data['fname'] = this.fname;
    data['mname'] = this.mname;
    data['lname'] = this.lname;
    data['nickname'] = this.nickname;
    data['email'] = this.email;
    data['telephone'] = this.telephone;
    data['mobile'] = this.mobile;
    data['gender'] = this.gender;
    data['avatar'] = this.avatar;
    data['avatar_content'] = this.avatarContent;
    data['country'] = this.country;
    data['country_iso_code'] = this.countryIsoCode;
    data['import_id'] = this.importId;
    return data;
  }
}
