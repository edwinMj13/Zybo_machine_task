import 'dart:convert';

OtpVerificationModel otpVerificationModelFromJson(String str) =>
    OtpVerificationModel.fromJson(json.decode(str));

String otpVerificationModelToJson(OtpVerificationModel data) =>
    json.encode(data.toJson());

class OtpVerificationModel {
  OtpVerificationModel({
    this.otp,
    this.token,
    this.user,
  });

  OtpVerificationModel.fromJson(dynamic json) {
    otp = json['otp'];
    token = json['token'] != null ? Token.fromJson(json['token']) : null;
    user = json['user'];
  }

  String? otp;
  Token? token;
  bool? user;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['otp'] = otp;
    if (token != null) {
      map['token'] = token?.toJson();
    }
    map['user'] = user;
    return map;
  }
}

Token tokenFromJson(String str) => Token.fromJson(json.decode(str));

String tokenToJson(Token data) => json.encode(data.toJson());

class Token {
  Token({
    this.access,
  });

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
{ "otp": "1234", "token": {"access": "<jwt_token>"}, "user": true }
 */
