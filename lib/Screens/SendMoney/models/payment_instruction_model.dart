class PaymentInstructionModel {
  String? message;
  Data? data;

  PaymentInstructionModel({this.message, this.data});

  PaymentInstructionModel.fromJson(Map<String, dynamic> json) {
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
  String? paymentMethodName;
  String? r1TransPaymentUrl;
  String? logoUrl;
  String? type;
  String? message;
  String? accountNumber;
  String? sortCode;
  String? bankName;
  String? extraBankDetails;

  Data(
      {this.paymentMethodName,
        this.r1TransPaymentUrl,
        this.logoUrl,
        this.type,
        this.message,
        this.accountNumber,
        this.sortCode,
        this.bankName,
        this.extraBankDetails});

  Data.fromJson(Map<String, dynamic> json) {
    paymentMethodName = json['payment_method_name'];
    r1TransPaymentUrl = json['r1_trans_payment_url'];
    logoUrl = json['logo_url'];
    type = json['type'];
    message = json['message'];
    accountNumber = json['account_number'];
    sortCode = json['sort_code'];
    bankName = json['bank_name'];
    extraBankDetails = json['extra_bank_details'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['payment_method_name'] = this.paymentMethodName;
    data['r1_trans_payment_url'] = this.r1TransPaymentUrl;
    data['logo_url'] = this.logoUrl;
    data['type'] = this.type;
    data['message'] = this.message;
    data['account_number'] = this.accountNumber;
    data['sort_code'] = this.sortCode;
    data['bank_name'] = this.bankName;
    data['extra_bank_details'] = this.extraBankDetails;
    return data;
  }
}
