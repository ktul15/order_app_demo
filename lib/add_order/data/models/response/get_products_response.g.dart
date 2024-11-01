// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_products_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetProductsResponse _$GetProductsResponseFromJson(Map<String, dynamic> json) =>
    GetProductsResponse(
      getProductsResult: (json['GetProductsResult'] as List<dynamic>?)
          ?.map((e) => GetProductsResult.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetProductsResponseToJson(GetProductsResponse instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('GetProductsResult',
      instance.getProductsResult?.map((e) => e.toJson()).toList());
  return val;
}

GetProductsResult _$GetProductsResultFromJson(Map<String, dynamic> json) =>
    GetProductsResult(
      id: (json['Id'] as num?)?.toInt(),
      name: json['Name'] as String?,
      price: (json['Price'] as num?)?.toDouble(),
      productCategory: json['ProductCategory'] as String?,
      productCode: json['ProductCode'] as String?,
      productVatId: (json['ProductVatId'] as num?)?.toInt(),
    );

Map<String, dynamic> _$GetProductsResultToJson(GetProductsResult instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Id', instance.id);
  writeNotNull('Name', instance.name);
  writeNotNull('Price', instance.price);
  writeNotNull('ProductCategory', instance.productCategory);
  writeNotNull('ProductCode', instance.productCode);
  writeNotNull('ProductVatId', instance.productVatId);
  return val;
}
