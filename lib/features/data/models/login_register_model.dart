import 'dart:convert';
LoginRegisterModel otpVerificationModelFromJson(String str) => LoginRegisterModel.fromJson(json.decode(str));
String otpVerificationModelToJson(LoginRegisterModel data) => json.encode(data.toJson());
class LoginRegisterModel {
  LoginRegisterModel({
      this.token, 
      this.userId, 
      this.message,});

  LoginRegisterModel.fromJson(dynamic json) {
    token = json['token'] != null ? Token.fromJson(json['token']) : null;
    userId = json['user_id'];
    message = json['message'];
  }
  Token? token;
  String? userId;
  String? message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (token != null) {
      map['token'] = token?.toJson();
    }
    map['user_id'] = userId;
    map['message'] = message;
    return map;
  }

}

Token tokenFromJson(String str) => Token.fromJson(json.decode(str));
String tokenToJson(Token data) => json.encode(data.toJson());
class Token {
  Token({
      this.access,});

  Token.fromJson(dynamic json) {
    access = json['access'];
  }
  String? access;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['access'] = access;
    return map;
  }

}
/*
{
    "token": {
        "access": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzM5NDUwNTU2LCJpYXQiOjE3MzgxNTQ1NTYsImp0aSI6ImYzYTM3NmM1NzU4MTRlNWRhZDA3M2QwMGE4YmY0YjJkIiwidXNlcl9pZCI6Imt1MDIyOCJ9.mA6Kmjo6a-3cg_LNBYSlcpXAapi89S_wnKyZhdd5-oQ"
    },
    "user_id": "ku0228",
    "message": "Login Successful"
}
 */