class GetProductsRequest {
  User? user;
  String? syncDate;
  int? pageIndex;
  String? appVersionNo;
  String? deviceDate;

  GetProductsRequest(
      {this.user,
      this.syncDate,
      this.pageIndex,
      this.appVersionNo,
      this.deviceDate});

  GetProductsRequest.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    syncDate = json['syncDate'];
    pageIndex = json['pageIndex'];
    appVersionNo = json['appVersionNo'];
    deviceDate = json['deviceDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['syncDate'] = this.syncDate;
    data['pageIndex'] = this.pageIndex;
    data['appVersionNo'] = this.appVersionNo;
    data['deviceDate'] = this.deviceDate;
    return data;
  }
}

class User {
  String? userName;
  String? password;
  String? deviceId;
  bool? active;
  String? appType;
  String? firstName;
  int? id;
  bool? isResetSync;
  String? lastName;
  String? orderCode;
  int? orderCount;
  int? orderPredictionCount;
  String? role;

  User(
      {this.userName,
      this.password,
      this.deviceId,
      this.active,
      this.appType,
      this.firstName,
      this.id,
      this.isResetSync,
      this.lastName,
      this.orderCode,
      this.orderCount,
      this.orderPredictionCount,
      this.role});

  User.fromJson(Map<String, dynamic> json) {
    userName = json['UserName'];
    password = json['Password'];
    deviceId = json['DeviceId'];
    active = json['Active'];
    appType = json['AppType'];
    firstName = json['FirstName'];
    id = json['Id'];
    isResetSync = json['IsResetSync'];
    lastName = json['LastName'];
    orderCode = json['OrderCode'];
    orderCount = json['OrderCount'];
    orderPredictionCount = json['OrderPredictionCount'];
    role = json['Role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['UserName'] = this.userName;
    data['Password'] = this.password;
    data['DeviceId'] = this.deviceId;
    data['Active'] = this.active;
    data['AppType'] = this.appType;
    data['FirstName'] = this.firstName;
    data['Id'] = this.id;
    data['IsResetSync'] = this.isResetSync;
    data['LastName'] = this.lastName;
    data['OrderCode'] = this.orderCode;
    data['OrderCount'] = this.orderCount;
    data['OrderPredictionCount'] = this.orderPredictionCount;
    data['Role'] = this.role;
    return data;
  }
}
