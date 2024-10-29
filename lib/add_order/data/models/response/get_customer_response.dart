class GetCustomerResponse {
  List<GetCustomersResult>? getCustomersResult;

  GetCustomerResponse({this.getCustomersResult});

  GetCustomerResponse.fromJson(Map<String, dynamic> json) {
    if (json['GetCustomersResult'] != null) {
      getCustomersResult = <GetCustomersResult>[];
      json['GetCustomersResult'].forEach((v) {
        getCustomersResult!.add(new GetCustomersResult.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.getCustomersResult != null) {
      data['GetCustomersResult'] =
          this.getCustomersResult!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class GetCustomersResult {
  String? accountRef;
  String? address1;
  String? address2;
  String? address3;
  String? address4;
  String? address5;
  String? cAddress1;
  String? cAddress2;
  String? cAddress3;
  String? cAddress4;
  String? cAddress5;
  String? contactName;
  String? countryCode;
  String? createdDate;
  String? dateAccountOpened;
  double? discountPercentage;
  String? email;
  String? fax;
  bool? isCostcutter;
  bool? isDeleted;
  bool? isHenderson;
  bool? isMessageEnabled;
  bool? isMusgrave;
  bool? isPredictionEnable;
  bool? isTemplateEnable;
  String? message;
  String? modifiedDate;
  String? name;
  String? telephone;
  String? telephone2;
  String? webAddress;

  GetCustomersResult(
      {this.accountRef,
      this.address1,
      this.address2,
      this.address3,
      this.address4,
      this.address5,
      this.cAddress1,
      this.cAddress2,
      this.cAddress3,
      this.cAddress4,
      this.cAddress5,
      this.contactName,
      this.countryCode,
      this.createdDate,
      this.dateAccountOpened,
      this.discountPercentage,
      this.email,
      this.fax,
      this.isCostcutter,
      this.isDeleted,
      this.isHenderson,
      this.isMessageEnabled,
      this.isMusgrave,
      this.isPredictionEnable,
      this.isTemplateEnable,
      this.message,
      this.modifiedDate,
      this.name,
      this.telephone,
      this.telephone2,
      this.webAddress});

  GetCustomersResult.fromJson(Map<String, dynamic> json) {
    accountRef = json['AccountRef'];
    address1 = json['Address1'];
    address2 = json['Address2'];
    address3 = json['Address3'];
    address4 = json['Address4'];
    address5 = json['Address5'];
    cAddress1 = json['CAddress1'];
    cAddress2 = json['CAddress2'];
    cAddress3 = json['CAddress3'];
    cAddress4 = json['CAddress4'];
    cAddress5 = json['CAddress5'];
    contactName = json['ContactName'];
    countryCode = json['CountryCode'];
    createdDate = json['CreatedDate'];
    dateAccountOpened = json['DateAccountOpened'];
    discountPercentage = double.tryParse(json['DiscountPercentage'].toString());
    email = json['Email'];
    fax = json['Fax'];
    isCostcutter = json['IsCostcutter'];
    isDeleted = json['IsDeleted'];
    isHenderson = json['IsHenderson'];
    isMessageEnabled = json['IsMessageEnabled'];
    isMusgrave = json['IsMusgrave'];
    isPredictionEnable = json['IsPredictionEnable'];
    isTemplateEnable = json['IsTemplateEnable'];
    message = json['Message'];
    modifiedDate = json['ModifiedDate'];
    name = json['Name'];
    telephone = json['Telephone'];
    telephone2 = json['Telephone2'];
    webAddress = json['WebAddress'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['AccountRef'] = this.accountRef;
    data['Address1'] = this.address1;
    data['Address2'] = this.address2;
    data['Address3'] = this.address3;
    data['Address4'] = this.address4;
    data['Address5'] = this.address5;
    data['CAddress1'] = this.cAddress1;
    data['CAddress2'] = this.cAddress2;
    data['CAddress3'] = this.cAddress3;
    data['CAddress4'] = this.cAddress4;
    data['CAddress5'] = this.cAddress5;
    data['ContactName'] = this.contactName;
    data['CountryCode'] = this.countryCode;
    data['CreatedDate'] = this.createdDate;
    data['DateAccountOpened'] = this.dateAccountOpened;
    data['DiscountPercentage'] = this.discountPercentage;
    data['Email'] = this.email;
    data['Fax'] = this.fax;
    data['IsCostcutter'] = this.isCostcutter;
    data['IsDeleted'] = this.isDeleted;
    data['IsHenderson'] = this.isHenderson;
    data['IsMessageEnabled'] = this.isMessageEnabled;
    data['IsMusgrave'] = this.isMusgrave;
    data['IsPredictionEnable'] = this.isPredictionEnable;
    data['IsTemplateEnable'] = this.isTemplateEnable;
    data['Message'] = this.message;
    data['ModifiedDate'] = this.modifiedDate;
    data['Name'] = this.name;
    data['Telephone'] = this.telephone;
    data['Telephone2'] = this.telephone2;
    data['WebAddress'] = this.webAddress;
    return data;
  }
}
