// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_customer_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCustomerResponse _$GetCustomerResponseFromJson(Map<String, dynamic> json) =>
    GetCustomerResponse(
      getCustomersResult: (json['GetCustomersResult'] as List<dynamic>?)
          ?.map((e) => GetCustomersResult.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetCustomerResponseToJson(GetCustomerResponse instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('GetCustomersResult',
      instance.getCustomersResult?.map((e) => e.toJson()).toList());
  return val;
}

GetCustomersResult _$GetCustomersResultFromJson(Map<String, dynamic> json) =>
    GetCustomersResult(
      accountRef: json['AccountRef'] as String?,
      name: json['Name'] as String?,
      discountPercentage: (json['DiscountPercentage'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$GetCustomersResultToJson(GetCustomersResult instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AccountRef', instance.accountRef);
  writeNotNull('Name', instance.name);
  writeNotNull('DiscountPercentage', instance.discountPercentage);
  return val;
}
