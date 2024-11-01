import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_customer_response.g.dart';

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class GetCustomerResponse {
  @JsonKey(name: "GetCustomersResult")
  List<GetCustomersResult>? getCustomersResult;

  GetCustomerResponse({this.getCustomersResult});

  factory GetCustomerResponse.fromJson(Map<String, dynamic> json) =>
      _$GetCustomerResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetCustomerResponseToJson(this);
}

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class GetCustomersResult {
  @JsonKey(name: "AccountRef")
  String? accountRef;
  @JsonKey(name: "Name")
  String? name;
  @JsonKey(name: "DiscountPercentage")
  double? discountPercentage;

  GetCustomersResult({
    this.accountRef,
    this.name,
    this.discountPercentage,
  });

  factory GetCustomersResult.fromJson(Map<String, dynamic> json) =>
      _$GetCustomersResultFromJson(json);

  Map<String, dynamic> toJson() => _$GetCustomersResultToJson(this);
}
