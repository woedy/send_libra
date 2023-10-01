class UserProfileModel {
  String? message;
  Data? data;

  UserProfileModel({this.message, this.data});

  UserProfileModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? remitterId;
  String? status;
  String? localName;
  String? firstname;
  String? middlename;
  String? lastname;
  String? gender;
  String? avatar;
  String? avatarContent;
  String? street;
  String? buildingNo;
  String? address1;
  String? address2;
  String? address3;
  String? city;
  String? state;
  String? postcode;
  String? country;
  String? countryId;
  String? countryIsoCode;
  String? telephone;
  String? mobile;
  String? fax;
  String? email;
  String? dob;
  String? placeOfBirth;
  String? countryOfBirth;
  String? nationality;
  String? tempMember;
  String? fathersName;
  String? mothersName;
  String? nationalIdNumber;
  String? verified;
  String? receiveMarketing;
  String? language;
  List<IdDocuments>? idDocuments;
  String? kycVideo;
  String? occupation;
  String? purpose;
  String? sourceOfIncome;
  String? accountNumber;
  String? annualIncome;
  String? annualRemittance;
  String? sortCode;
  String? type;
  String? employer;
  String? businessAddress;
  String? businessType;
  String? contractDate;
  String? orgtype;
  String? hearAboutUs;
  String? hearAboutUsOther;
  String? cpfNumber;
  String? taxpayerReg;
  String? cardIssueDate;
  String? defaultTransferPurpose;
  String? groups;
  String? creationDate;
  String? awaitingMerge;
  String? loyaltyPoints;

  Data(
      {this.remitterId,
        this.status,
        this.localName,
        this.firstname,
        this.middlename,
        this.lastname,
        this.gender,
        this.avatar,
        this.avatarContent,
        this.street,
        this.buildingNo,
        this.address1,
        this.address2,
        this.address3,
        this.city,
        this.state,
        this.postcode,
        this.country,
        this.countryId,
        this.countryIsoCode,
        this.telephone,
        this.mobile,
        this.fax,
        this.email,
        this.dob,
        this.placeOfBirth,
        this.countryOfBirth,
        this.nationality,
        this.tempMember,
        this.fathersName,
        this.mothersName,
        this.nationalIdNumber,
        this.verified,
        this.receiveMarketing,
        this.language,
        this.idDocuments,
        this.kycVideo,
        this.occupation,
        this.purpose,
        this.sourceOfIncome,
        this.accountNumber,
        this.annualIncome,
        this.annualRemittance,
        this.sortCode,
        this.type,
        this.employer,
        this.businessAddress,
        this.businessType,
        this.contractDate,
        this.orgtype,
        this.hearAboutUs,
        this.hearAboutUsOther,
        this.cpfNumber,
        this.taxpayerReg,
        this.cardIssueDate,
        this.defaultTransferPurpose,
        this.groups,
        this.creationDate,
        this.awaitingMerge,
        this.loyaltyPoints});

  Data.fromJson(Map<String, dynamic> json) {
    remitterId = json['remitter_id'];
    status = json['status'];
    localName = json['local_name'];
    firstname = json['firstname'];
    middlename = json['middlename'];
    lastname = json['lastname'];
    gender = json['gender'];
    avatar = json['avatar'];
    avatarContent = json['avatar_content'];
    street = json['street'];
    buildingNo = json['building_no'];
    address1 = json['address1'];
    address2 = json['address2'];
    address3 = json['address3'];
    city = json['city'];
    state = json['state'];
    postcode = json['postcode'];
    country = json['country'];
    countryId = json['country_id'];
    countryIsoCode = json['country_iso_code'];
    telephone = json['telephone'];
    mobile = json['mobile'];
    fax = json['fax'];
    email = json['email'];
    dob = json['dob'];
    placeOfBirth = json['place_of_birth'];
    countryOfBirth = json['country_of_birth'];
    nationality = json['nationality'];
    tempMember = json['temp_member'];
    fathersName = json['fathers_name'];
    mothersName = json['mothers_name'];
    nationalIdNumber = json['national_id_number'];
    verified = json['verified'];
    receiveMarketing = json['receive_marketing'];
    language = json['language'];
    if (json['id_documents'] != null) {
      idDocuments = <IdDocuments>[];
      json['id_documents'].forEach((v) {
        idDocuments!.add(new IdDocuments.fromJson(v));
      });
    }
    kycVideo = json['kyc_video'];
    occupation = json['occupation'];
    purpose = json['purpose'];
    sourceOfIncome = json['source_of_income'];
    accountNumber = json['account_number'];
    annualIncome = json['annual_income'];
    annualRemittance = json['annual_remittance'];
    sortCode = json['sort_code'];
    type = json['type'];
    employer = json['employer'];
    businessAddress = json['business_address'];
    businessType = json['business_type'];
    contractDate = json['contract_date'];
    orgtype = json['orgtype'];
    hearAboutUs = json['hear_about_us'];
    hearAboutUsOther = json['hear_about_us_other'];
    cpfNumber = json['cpf_number'];
    taxpayerReg = json['taxpayer_reg'];
    cardIssueDate = json['card_issue_date'];
    defaultTransferPurpose = json['default_transfer_purpose'];
    groups = json['groups'];
    creationDate = json['creation_date'];
    awaitingMerge = json['awaiting_merge'];
    loyaltyPoints = json['loyalty_points'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['remitter_id'] = this.remitterId;
    data['status'] = this.status;
    data['local_name'] = this.localName;
    data['firstname'] = this.firstname;
    data['middlename'] = this.middlename;
    data['lastname'] = this.lastname;
    data['gender'] = this.gender;
    data['avatar'] = this.avatar;
    data['avatar_content'] = this.avatarContent;
    data['street'] = this.street;
    data['building_no'] = this.buildingNo;
    data['address1'] = this.address1;
    data['address2'] = this.address2;
    data['address3'] = this.address3;
    data['city'] = this.city;
    data['state'] = this.state;
    data['postcode'] = this.postcode;
    data['country'] = this.country;
    data['country_id'] = this.countryId;
    data['country_iso_code'] = this.countryIsoCode;
    data['telephone'] = this.telephone;
    data['mobile'] = this.mobile;
    data['fax'] = this.fax;
    data['email'] = this.email;
    data['dob'] = this.dob;
    data['place_of_birth'] = this.placeOfBirth;
    data['country_of_birth'] = this.countryOfBirth;
    data['nationality'] = this.nationality;
    data['temp_member'] = this.tempMember;
    data['fathers_name'] = this.fathersName;
    data['mothers_name'] = this.mothersName;
    data['national_id_number'] = this.nationalIdNumber;
    data['verified'] = this.verified;
    data['receive_marketing'] = this.receiveMarketing;
    data['language'] = this.language;
    if (this.idDocuments != null) {
      data['id_documents'] = this.idDocuments!.map((v) => v.toJson()).toList();
    }
    data['kyc_video'] = this.kycVideo;
    data['occupation'] = this.occupation;
    data['purpose'] = this.purpose;
    data['source_of_income'] = this.sourceOfIncome;
    data['account_number'] = this.accountNumber;
    data['annual_income'] = this.annualIncome;
    data['annual_remittance'] = this.annualRemittance;
    data['sort_code'] = this.sortCode;
    data['type'] = this.type;
    data['employer'] = this.employer;
    data['business_address'] = this.businessAddress;
    data['business_type'] = this.businessType;
    data['contract_date'] = this.contractDate;
    data['orgtype'] = this.orgtype;
    data['hear_about_us'] = this.hearAboutUs;
    data['hear_about_us_other'] = this.hearAboutUsOther;
    data['cpf_number'] = this.cpfNumber;
    data['taxpayer_reg'] = this.taxpayerReg;
    data['card_issue_date'] = this.cardIssueDate;
    data['default_transfer_purpose'] = this.defaultTransferPurpose;
    data['groups'] = this.groups;
    data['creation_date'] = this.creationDate;
    data['awaiting_merge'] = this.awaitingMerge;
    data['loyalty_points'] = this.loyaltyPoints;
    return data;
  }
}

class IdDocuments {
  List<IdDocument>? idDocument;

  IdDocuments({this.idDocument});

  IdDocuments.fromJson(Map<String, dynamic> json) {
    if (json['id_document'] != null) {
      idDocument = <IdDocument>[];
      json['id_document'].forEach((v) {
        idDocument!.add(new IdDocument.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.idDocument != null) {
      data['id_document'] = this.idDocument!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class IdDocument {
  String? idType;
  String? idDetails;
  String? idIssuedBy;
  String? idIssuePlace;
  String? idIssueCountry;
  String? idStart;
  String? idExpiry;
  String? idVerified;
  String? idScan1;
  String? idScan1Content;
  String? idScan2;
  String? idScan2Content;
  String? idScan3;
  String? idScan3Content;

  IdDocument(
      {this.idType,
        this.idDetails,
        this.idIssuedBy,
        this.idIssuePlace,
        this.idIssueCountry,
        this.idStart,
        this.idExpiry,
        this.idVerified,
        this.idScan1,
        this.idScan1Content,
        this.idScan2,
        this.idScan2Content,
        this.idScan3,
        this.idScan3Content});

  IdDocument.fromJson(Map<String, dynamic> json) {
    idType = json['id_type'];
    idDetails = json['id_details'];
    idIssuedBy = json['id_issued_by'];
    idIssuePlace = json['id_issue_place'];
    idIssueCountry = json['id_issue_country'];
    idStart = json['id_start'];
    idExpiry = json['id_expiry'];
    idVerified = json['id_verified'];
    idScan1 = json['id_scan1'];
    idScan1Content = json['id_scan1_content'];
    idScan2 = json['id_scan2'];
    idScan2Content = json['id_scan2_content'];
    idScan3 = json['id_scan3'];
    idScan3Content = json['id_scan3_content'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_type'] = this.idType;
    data['id_details'] = this.idDetails;
    data['id_issued_by'] = this.idIssuedBy;
    data['id_issue_place'] = this.idIssuePlace;
    data['id_issue_country'] = this.idIssueCountry;
    data['id_start'] = this.idStart;
    data['id_expiry'] = this.idExpiry;
    data['id_verified'] = this.idVerified;
    data['id_scan1'] = this.idScan1;
    data['id_scan1_content'] = this.idScan1Content;
    data['id_scan2'] = this.idScan2;
    data['id_scan2_content'] = this.idScan2Content;
    data['id_scan3'] = this.idScan3;
    data['id_scan3_content'] = this.idScan3Content;
    return data;
  }
}
