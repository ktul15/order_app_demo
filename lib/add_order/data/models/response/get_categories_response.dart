class GetCategoriesResponse {
  List<String>? getCategoriesResult;

  GetCategoriesResponse({this.getCategoriesResult});

  GetCategoriesResponse.fromJson(Map<String, dynamic> json) {
    getCategoriesResult = json['GetCategoriesResult'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['GetCategoriesResult'] = getCategoriesResult;
    return data;
  }
}
