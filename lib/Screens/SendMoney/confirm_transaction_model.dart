class ConfirmTransactionModel {
  String? message;
  Data? data;

  ConfirmTransactionModel({this.message, this.data});

  ConfirmTransactionModel.fromJson(Map<String, dynamic> json) {
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
  String? transRef;
  String? agentTransRef;
  String? benefTransRef;
  String? status;
  String? creationDate;
  String? purpose;
  String? sourceOfIncome;
  String? processingBank;
  String? bankAcceptDate;
  String? bankBranchAcceptDate;
  String? deliveryDate;
  String? processedDate;
  String? processedBy;
  String? paymentGatewayAcknowledged;
  String? transType;
  String? benefId;
  String? benefName;
  String? benefTel;
  String? benefMobile;
  String? benefEmail;
  String? benefIdType;
  String? benefIdDetail;
  String? commentsToBeneficiary;
  String? collectionPoint;
  String? collectionPointId;
  String? collectionPointBank;
  String? collectionPointCode;
  String? collectionPointAddress;
  String? collectionPointCity;
  String? collectionPointState;
  String? collectionPin;
  String? benefBankAccountNumber;
  String? benefBankAccountType;
  String? benefBankAccountName;
  String? benefBank;
  String? benefBankCity;
  String? benefBankState;
  String? benefBankIban;
  String? benefBankSwiftCode;
  String? benefBankBsbCode;
  String? benefBankIfscCode;
  String? benefBankRoutingTransitNumber;
  String? benefBranch;
  String? benefBranchCode;
  String? benefBranchTelephone;
  String? benefBranchManager;
  String? additionalBenefBank;
  String? additionalBenefBankBranch;
  String? benefCardType;
  String? benefCardNumber;
  String? benefAddress1;
  String? benefAddress2;
  String? benefAddress3;
  String? benefCity;
  String? benefState;
  String? benefPostcode;
  String? benefMobiletransferNumber;
  String? benefMobiletransferNetwork;
  String? benefMobiletransferNetworkCreditType;
  String? remittBenefRelation;
  String? deliveryNotes;
  String? utilitybillCompany;
  String? utilitybillAccountNo;
  String? utilitybillInvoice;
  String? utilitybillAddress1;
  String? utilitybillAddress2;
  String? utilitybillAddress3;
  String? utilitybillCity;
  String? utilitybillState;
  String? utilitybillPostcode;
  String? utilitybillBank;
  String? utilitybillBankCode;
  String? utilitybillBankBic;
  String? utilitybillDescription;
  String? paymentMethod;
  String? paymentMethodName;
  String? paymentToken;
  String? sendCountry;
  String? sendCurrency;
  String? sendAmount;
  String? rate;
  String? commission;
  String? commissionBeforePromotion;
  String? promotionNames;
  String? promotionIds;
  String? loyaltyPointsUsed;
  String? loyaltyPointsDiscount;
  String? loyaltyPointsEarned;
  String? serviceLevel;
  String? serviceLevelName;
  String? fees;
  String? tax;
  String? totalCharges;
  String? remitterPay;
  String? receiveCountry;
  String? receiveCurrency;
  String? receiveAmount;
  String? bankSequence;
  String? payMethod;
  String? issueDate;
  String? bankRef;
  String? bankComments;
  String? bankCreditDate;
  String? bankClearDate;

  Data(
      {this.transRef,
        this.agentTransRef,
        this.benefTransRef,
        this.status,
        this.creationDate,
        this.purpose,
        this.sourceOfIncome,
        this.processingBank,
        this.bankAcceptDate,
        this.bankBranchAcceptDate,
        this.deliveryDate,
        this.processedDate,
        this.processedBy,
        this.paymentGatewayAcknowledged,
        this.transType,
        this.benefId,
        this.benefName,
        this.benefTel,
        this.benefMobile,
        this.benefEmail,
        this.benefIdType,
        this.benefIdDetail,
        this.commentsToBeneficiary,
        this.collectionPoint,
        this.collectionPointId,
        this.collectionPointBank,
        this.collectionPointCode,
        this.collectionPointAddress,
        this.collectionPointCity,
        this.collectionPointState,
        this.collectionPin,
        this.benefBankAccountNumber,
        this.benefBankAccountType,
        this.benefBankAccountName,
        this.benefBank,
        this.benefBankCity,
        this.benefBankState,
        this.benefBankIban,
        this.benefBankSwiftCode,
        this.benefBankBsbCode,
        this.benefBankIfscCode,
        this.benefBankRoutingTransitNumber,
        this.benefBranch,
        this.benefBranchCode,
        this.benefBranchTelephone,
        this.benefBranchManager,
        this.additionalBenefBank,
        this.additionalBenefBankBranch,
        this.benefCardType,
        this.benefCardNumber,
        this.benefAddress1,
        this.benefAddress2,
        this.benefAddress3,
        this.benefCity,
        this.benefState,
        this.benefPostcode,
        this.benefMobiletransferNumber,
        this.benefMobiletransferNetwork,
        this.benefMobiletransferNetworkCreditType,
        this.remittBenefRelation,
        this.deliveryNotes,
        this.utilitybillCompany,
        this.utilitybillAccountNo,
        this.utilitybillInvoice,
        this.utilitybillAddress1,
        this.utilitybillAddress2,
        this.utilitybillAddress3,
        this.utilitybillCity,
        this.utilitybillState,
        this.utilitybillPostcode,
        this.utilitybillBank,
        this.utilitybillBankCode,
        this.utilitybillBankBic,
        this.utilitybillDescription,
        this.paymentMethod,
        this.paymentMethodName,
        this.paymentToken,
        this.sendCountry,
        this.sendCurrency,
        this.sendAmount,
        this.rate,
        this.commission,
        this.commissionBeforePromotion,
        this.promotionNames,
        this.promotionIds,
        this.loyaltyPointsUsed,
        this.loyaltyPointsDiscount,
        this.loyaltyPointsEarned,
        this.serviceLevel,
        this.serviceLevelName,
        this.fees,
        this.tax,
        this.totalCharges,
        this.remitterPay,
        this.receiveCountry,
        this.receiveCurrency,
        this.receiveAmount,
        this.bankSequence,
        this.payMethod,
        this.issueDate,
        this.bankRef,
        this.bankComments,
        this.bankCreditDate,
        this.bankClearDate});

  Data.fromJson(Map<String, dynamic> json) {
    transRef = json['trans_ref'];
    agentTransRef = json['agent_trans_ref'];
    benefTransRef = json['benef_trans_ref'];
    status = json['status'];
    creationDate = json['creation_date'];
    purpose = json['purpose'];
    sourceOfIncome = json['source_of_income'];
    processingBank = json['processing_bank'];
    bankAcceptDate = json['bank_accept_date'];
    bankBranchAcceptDate = json['bank_branch_accept_date'];
    deliveryDate = json['delivery_date'];
    processedDate = json['processed_date'];
    processedBy = json['processed_by'];
    paymentGatewayAcknowledged = json['payment_gateway_acknowledged'];
    transType = json['trans_type'];
    benefId = json['benef_id'];
    benefName = json['benef_name'];
    benefTel = json['benef_tel'];
    benefMobile = json['benef_mobile'];
    benefEmail = json['benef_email'];
    benefIdType = json['benef_id_type'];
    benefIdDetail = json['benef_id_detail'];
    commentsToBeneficiary = json['comments_to_beneficiary'];
    collectionPoint = json['collection_point'];
    collectionPointId = json['collection_point_id'];
    collectionPointBank = json['collection_point_bank'];
    collectionPointCode = json['collection_point_code'];
    collectionPointAddress = json['collection_point_address'];
    collectionPointCity = json['collection_point_city'];
    collectionPointState = json['collection_point_state'];
    collectionPin = json['collection_pin'];
    benefBankAccountNumber = json['benef_bank_account_number'];
    benefBankAccountType = json['benef_bank_account_type'];
    benefBankAccountName = json['benef_bank_account_name'];
    benefBank = json['benef_bank'];
    benefBankCity = json['benef_bank_city'];
    benefBankState = json['benef_bank_state'];
    benefBankIban = json['benef_bank_iban'];
    benefBankSwiftCode = json['benef_bank_swift_code'];
    benefBankBsbCode = json['benef_bank_bsb_code'];
    benefBankIfscCode = json['benef_bank_ifsc_code'];
    benefBankRoutingTransitNumber = json['benef_bank_routing_transit_number'];
    benefBranch = json['benef_branch'];
    benefBranchCode = json['benef_branch_code'];
    benefBranchTelephone = json['benef_branch_telephone'];
    benefBranchManager = json['benef_branch_manager'];
    additionalBenefBank = json['additional_benef_bank'];
    additionalBenefBankBranch = json['additional_benef_bank_branch'];
    benefCardType = json['benef_card_type'];
    benefCardNumber = json['benef_card_number'];
    benefAddress1 = json['benef_address1'];
    benefAddress2 = json['benef_address2'];
    benefAddress3 = json['benef_address3'];
    benefCity = json['benef_city'];
    benefState = json['benef_state'];
    benefPostcode = json['benef_postcode'];
    benefMobiletransferNumber = json['benef_mobiletransfer_number'];
    benefMobiletransferNetwork = json['benef_mobiletransfer_network'];
    benefMobiletransferNetworkCreditType =
    json['benef_mobiletransfer_network_credit_type'];
    remittBenefRelation = json['remitt_benef_relation'];
    deliveryNotes = json['delivery_notes'];
    utilitybillCompany = json['utilitybill_company'];
    utilitybillAccountNo = json['utilitybill_account_no'];
    utilitybillInvoice = json['utilitybill_invoice'];
    utilitybillAddress1 = json['utilitybill_address1'];
    utilitybillAddress2 = json['utilitybill_address2'];
    utilitybillAddress3 = json['utilitybill_address3'];
    utilitybillCity = json['utilitybill_city'];
    utilitybillState = json['utilitybill_state'];
    utilitybillPostcode = json['utilitybill_postcode'];
    utilitybillBank = json['utilitybill_bank'];
    utilitybillBankCode = json['utilitybill_bank_code'];
    utilitybillBankBic = json['utilitybill_bank_bic'];
    utilitybillDescription = json['utilitybill_description'];
    paymentMethod = json['payment_method'];
    paymentMethodName = json['payment_method_name'];
    paymentToken = json['payment_token'];
    sendCountry = json['send_country'];
    sendCurrency = json['send_currency'];
    sendAmount = json['send_amount'];
    rate = json['rate'];
    commission = json['commission'];
    commissionBeforePromotion = json['commission_before_promotion'];
    promotionNames = json['promotion_names'];
    promotionIds = json['promotion_ids'];
    loyaltyPointsUsed = json['loyalty_points_used'];
    loyaltyPointsDiscount = json['loyalty_points_discount'];
    loyaltyPointsEarned = json['loyalty_points_earned'];
    serviceLevel = json['service_level'];
    serviceLevelName = json['service_level_name'];
    fees = json['fees'];
    tax = json['tax'];
    totalCharges = json['total_charges'];
    remitterPay = json['remitter_pay'];
    receiveCountry = json['receive_country'];
    receiveCurrency = json['receive_currency'];
    receiveAmount = json['receive_amount'];
    bankSequence = json['bank_sequence'];
    payMethod = json['pay_method'];
    issueDate = json['issue_date'];
    bankRef = json['bank_ref'];
    bankComments = json['bank_comments'];
    bankCreditDate = json['bank_credit_date'];
    bankClearDate = json['bank_clear_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['trans_ref'] = this.transRef;
    data['agent_trans_ref'] = this.agentTransRef;
    data['benef_trans_ref'] = this.benefTransRef;
    data['status'] = this.status;
    data['creation_date'] = this.creationDate;
    data['purpose'] = this.purpose;
    data['source_of_income'] = this.sourceOfIncome;
    data['processing_bank'] = this.processingBank;
    data['bank_accept_date'] = this.bankAcceptDate;
    data['bank_branch_accept_date'] = this.bankBranchAcceptDate;
    data['delivery_date'] = this.deliveryDate;
    data['processed_date'] = this.processedDate;
    data['processed_by'] = this.processedBy;
    data['payment_gateway_acknowledged'] = this.paymentGatewayAcknowledged;
    data['trans_type'] = this.transType;
    data['benef_id'] = this.benefId;
    data['benef_name'] = this.benefName;
    data['benef_tel'] = this.benefTel;
    data['benef_mobile'] = this.benefMobile;
    data['benef_email'] = this.benefEmail;
    data['benef_id_type'] = this.benefIdType;
    data['benef_id_detail'] = this.benefIdDetail;
    data['comments_to_beneficiary'] = this.commentsToBeneficiary;
    data['collection_point'] = this.collectionPoint;
    data['collection_point_id'] = this.collectionPointId;
    data['collection_point_bank'] = this.collectionPointBank;
    data['collection_point_code'] = this.collectionPointCode;
    data['collection_point_address'] = this.collectionPointAddress;
    data['collection_point_city'] = this.collectionPointCity;
    data['collection_point_state'] = this.collectionPointState;
    data['collection_pin'] = this.collectionPin;
    data['benef_bank_account_number'] = this.benefBankAccountNumber;
    data['benef_bank_account_type'] = this.benefBankAccountType;
    data['benef_bank_account_name'] = this.benefBankAccountName;
    data['benef_bank'] = this.benefBank;
    data['benef_bank_city'] = this.benefBankCity;
    data['benef_bank_state'] = this.benefBankState;
    data['benef_bank_iban'] = this.benefBankIban;
    data['benef_bank_swift_code'] = this.benefBankSwiftCode;
    data['benef_bank_bsb_code'] = this.benefBankBsbCode;
    data['benef_bank_ifsc_code'] = this.benefBankIfscCode;
    data['benef_bank_routing_transit_number'] =
        this.benefBankRoutingTransitNumber;
    data['benef_branch'] = this.benefBranch;
    data['benef_branch_code'] = this.benefBranchCode;
    data['benef_branch_telephone'] = this.benefBranchTelephone;
    data['benef_branch_manager'] = this.benefBranchManager;
    data['additional_benef_bank'] = this.additionalBenefBank;
    data['additional_benef_bank_branch'] = this.additionalBenefBankBranch;
    data['benef_card_type'] = this.benefCardType;
    data['benef_card_number'] = this.benefCardNumber;
    data['benef_address1'] = this.benefAddress1;
    data['benef_address2'] = this.benefAddress2;
    data['benef_address3'] = this.benefAddress3;
    data['benef_city'] = this.benefCity;
    data['benef_state'] = this.benefState;
    data['benef_postcode'] = this.benefPostcode;
    data['benef_mobiletransfer_number'] = this.benefMobiletransferNumber;
    data['benef_mobiletransfer_network'] = this.benefMobiletransferNetwork;
    data['benef_mobiletransfer_network_credit_type'] =
        this.benefMobiletransferNetworkCreditType;
    data['remitt_benef_relation'] = this.remittBenefRelation;
    data['delivery_notes'] = this.deliveryNotes;
    data['utilitybill_company'] = this.utilitybillCompany;
    data['utilitybill_account_no'] = this.utilitybillAccountNo;
    data['utilitybill_invoice'] = this.utilitybillInvoice;
    data['utilitybill_address1'] = this.utilitybillAddress1;
    data['utilitybill_address2'] = this.utilitybillAddress2;
    data['utilitybill_address3'] = this.utilitybillAddress3;
    data['utilitybill_city'] = this.utilitybillCity;
    data['utilitybill_state'] = this.utilitybillState;
    data['utilitybill_postcode'] = this.utilitybillPostcode;
    data['utilitybill_bank'] = this.utilitybillBank;
    data['utilitybill_bank_code'] = this.utilitybillBankCode;
    data['utilitybill_bank_bic'] = this.utilitybillBankBic;
    data['utilitybill_description'] = this.utilitybillDescription;
    data['payment_method'] = this.paymentMethod;
    data['payment_method_name'] = this.paymentMethodName;
    data['payment_token'] = this.paymentToken;
    data['send_country'] = this.sendCountry;
    data['send_currency'] = this.sendCurrency;
    data['send_amount'] = this.sendAmount;
    data['rate'] = this.rate;
    data['commission'] = this.commission;
    data['commission_before_promotion'] = this.commissionBeforePromotion;
    data['promotion_names'] = this.promotionNames;
    data['promotion_ids'] = this.promotionIds;
    data['loyalty_points_used'] = this.loyaltyPointsUsed;
    data['loyalty_points_discount'] = this.loyaltyPointsDiscount;
    data['loyalty_points_earned'] = this.loyaltyPointsEarned;
    data['service_level'] = this.serviceLevel;
    data['service_level_name'] = this.serviceLevelName;
    data['fees'] = this.fees;
    data['tax'] = this.tax;
    data['total_charges'] = this.totalCharges;
    data['remitter_pay'] = this.remitterPay;
    data['receive_country'] = this.receiveCountry;
    data['receive_currency'] = this.receiveCurrency;
    data['receive_amount'] = this.receiveAmount;
    data['bank_sequence'] = this.bankSequence;
    data['pay_method'] = this.payMethod;
    data['issue_date'] = this.issueDate;
    data['bank_ref'] = this.bankRef;
    data['bank_comments'] = this.bankComments;
    data['bank_credit_date'] = this.bankCreditDate;
    data['bank_clear_date'] = this.bankClearDate;
    return data;
  }
}
