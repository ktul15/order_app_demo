// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_categories_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCategoriesResponse _$GetCategoriesResponseFromJson(
        Map<String, dynamic> json) =>
    GetCategoriesResponse(
      getCategoriesResult: (json['GetCategoriesResult'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$GetCategoriesResponseToJson(
    GetCategoriesResponse instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('GetCategoriesResult', instance.getCategoriesResult);
  return val;
}
