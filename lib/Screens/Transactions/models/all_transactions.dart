class AllTransactionsModel {
  String? message;
  List<Data>? data;

  AllTransactionsModel({this.message, this.data});

  AllTransactionsModel.fromJson(Map<String, dynamic> json) {
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
  String? transRef;
  String? transType;
  String? status;
  String? creationDate;
  String? processedDate;
  String? originatingCountry;
  String? destinationCountry;
  String? sourceCurrency;
  String? sourceAmount;
  String? destCurrency;
  String? destAmount;
  String? paymentMethod;
  String? benefId;
  String? benefName;
  String? benefMobile;
  String? complianceNeeded;
  String? complianceChecked;
  String? extComplianceNeeded;
  String? extComplianceChecked;

  Data(
      {this.transRef,
        this.transType,
        this.status,
        this.creationDate,
        this.processedDate,
        this.originatingCountry,
        this.destinationCountry,
        this.sourceCurrency,
        this.sourceAmount,
        this.destCurrency,
        this.destAmount,
        this.paymentMethod,
        this.benefId,
        this.benefName,
        this.benefMobile,
        this.complianceNeeded,
        this.complianceChecked,
        this.extComplianceNeeded,
        this.extComplianceChecked});

  Data.fromJson(Map<String, dynamic> json) {
    transRef = json['trans_ref'];
    transType = json['trans_type'];
    status = json['status'];
    creationDate = json['creation_date'];
    processedDate = json['processed_date'];
    originatingCountry = json['originating_country'];
    destinationCountry = json['destination_country'];
    sourceCurrency = json['source_currency'];
    sourceAmount = json['source_amount'];
    destCurrency = json['dest_currency'];
    destAmount = json['dest_amount'];
    paymentMethod = json['payment_method'];
    benefId = json['benef_id'];
    benefName = json['benef_name'];
    benefMobile = json['benef_mobile'];
    complianceNeeded = json['compliance_needed'];
    complianceChecked = json['compliance_checked'];
    extComplianceNeeded = json['ext_compliance_needed'];
    extComplianceChecked = json['ext_compliance_checked'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['trans_ref'] = this.transRef;
    data['trans_type'] = this.transType;
    data['status'] = this.status;
    data['creation_date'] = this.creationDate;
    data['processed_date'] = this.processedDate;
    data['originating_country'] = this.originatingCountry;
    data['destination_country'] = this.destinationCountry;
    data['source_currency'] = this.sourceCurrency;
    data['source_amount'] = this.sourceAmount;
    data['dest_currency'] = this.destCurrency;
    data['dest_amount'] = this.destAmount;
    data['payment_method'] = this.paymentMethod;
    data['benef_id'] = this.benefId;
    data['benef_name'] = this.benefName;
    data['benef_mobile'] = this.benefMobile;
    data['compliance_needed'] = this.complianceNeeded;
    data['compliance_checked'] = this.complianceChecked;
    data['ext_compliance_needed'] = this.extComplianceNeeded;
    data['ext_compliance_checked'] = this.extComplianceChecked;
    return data;
  }
}
