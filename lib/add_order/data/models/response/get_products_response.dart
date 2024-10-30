class GetProductsResponse {
  List<GetProductsResult>? getProductsResult;

  GetProductsResponse({this.getProductsResult});

  GetProductsResponse.fromJson(Map<String, dynamic> json) {
    if (json['GetProductsResult'] != null) {
      getProductsResult = <GetProductsResult>[];
      json['GetProductsResult'].forEach((v) {
        getProductsResult!.add(new GetProductsResult.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.getProductsResult != null) {
      data['GetProductsResult'] =
          this.getProductsResult!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class GetProductsResult {
  String? barCode;
  String? createdDate;
  bool? deleted;
  int? id;
  bool? isSpecialOfferSelected;
  bool? isWeight;
  String? modifiedDate;
  String? name;
  String? nominalCode;
  int? packSize;
  double? price;
  String? productCategory;
  String? productCode;
  int? productVatId;

  GetProductsResult(
      {this.barCode,
      this.createdDate,
      this.deleted,
      this.id,
      this.isSpecialOfferSelected,
      this.isWeight,
      this.modifiedDate,
      this.name,
      this.nominalCode,
      this.packSize,
      this.price,
      this.productCategory,
      this.productCode,
      this.productVatId});

  GetProductsResult.fromJson(Map<String, dynamic> json) {
    barCode = json['BarCode'];
    createdDate = json['CreatedDate'];
    deleted = json['Deleted'];
    id = json['Id'];
    isSpecialOfferSelected = json['IsSpecialOfferSelected'];
    isWeight = json['IsWeight'];
    modifiedDate = json['ModifiedDate'];
    name = json['Name'];
    nominalCode = json['NominalCode'];
    packSize = json['PackSize'];
    price = json['Price'];
    productCategory = json['ProductCategory'];
    productCode = json['ProductCode'];
    productVatId = json['ProductVatId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['BarCode'] = this.barCode;
    data['CreatedDate'] = this.createdDate;
    data['Deleted'] = this.deleted;
    data['Id'] = this.id;
    data['IsSpecialOfferSelected'] = this.isSpecialOfferSelected;
    data['IsWeight'] = this.isWeight;
    data['ModifiedDate'] = this.modifiedDate;
    data['Name'] = this.name;
    data['NominalCode'] = this.nominalCode;
    data['PackSize'] = this.packSize;
    data['Price'] = this.price;
    data['ProductCategory'] = this.productCategory;
    data['ProductCode'] = this.productCode;
    data['ProductVatId'] = this.productVatId;
    return data;
  }
}
