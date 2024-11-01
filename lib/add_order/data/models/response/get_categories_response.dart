import 'package:json_annotation/json_annotation.dart';

part 'get_categories_response.g.dart';

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class GetCategoriesResponse {
  @JsonKey(name: "GetCategoriesResult")
  List<String>? getCategoriesResult;

  GetCategoriesResponse({this.getCategoriesResult});

  factory GetCategoriesResponse.fromJson(Map<String, dynamic> json) =>
      _$GetCategoriesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetCategoriesResponseToJson(this);
}
