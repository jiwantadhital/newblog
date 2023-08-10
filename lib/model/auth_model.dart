class LoginModel {
  String? token;
  String? message;
  int? userId;
  String? userName;
  int? userType;
  String? userEmail;

  LoginModel(
      {this.token,
      this.message,
      this.userId,
      this.userName,
      this.userType,
      this.userEmail});

  LoginModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    message = json['message'];
    userId = json['user_id'];
    userName = json['user_name'];
    userType = json['user_type'];
    userEmail = json['user_email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['message'] = this.message;
    data['user_id'] = this.userId;
    data['user_name'] = this.userName;
    data['user_type'] = this.userType;
    data['user_email'] = this.userEmail;
    return data;
  }
}
