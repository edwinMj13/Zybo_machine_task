import 'dart:convert';
WishlistAddRemModel wishlistAddRemModelFromJson(String str) => WishlistAddRemModel.fromJson(json.decode(str));
String wishlistAddRemModelToJson(WishlistAddRemModel data) => json.encode(data.toJson());
class WishlistAddRemModel {
  WishlistAddRemModel({
      this.message,});

  WishlistAddRemModel.fromJson(dynamic json) {
    message = json['message'];
  }
  String? message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    return map;
  }

}