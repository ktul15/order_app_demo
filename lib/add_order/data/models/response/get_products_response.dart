import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_products_response.g.dart';

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class GetProductsResponse {
  @JsonKey(name: "GetProductsResult")
  List<GetProductsResult>? getProductsResult;

  GetProductsResponse({this.getProductsResult});

  factory GetProductsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetProductsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetProductsResponseToJson(this);
}

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class GetProductsResult {
  @JsonKey(name: "Id")
  int? id;
  @JsonKey(name: "Name")
  String? name;
  @JsonKey(name: "Price")
  double? price;
  @JsonKey(name: "ProductCategory")
  String? productCategory;
  @JsonKey(name: "ProductCode")
  String? productCode;
  @JsonKey(name: "ProductVatId")
  int? productVatId;

  GetProductsResult(
      {this.id,
      this.name,
      this.price,
      this.productCategory,
      this.productCode,
      this.productVatId});

  factory GetProductsResult.fromJson(Map<String, dynamic> json) =>
      _$GetProductsResultFromJson(json);
  Map<String, dynamic> toJson() => _$GetProductsResultToJson(this);
}
