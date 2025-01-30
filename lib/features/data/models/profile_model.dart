import 'dart:convert';
ProfileModel profileModelFromJson(String str) => ProfileModel.fromJson(json.decode(str));
String profileModelToJson(ProfileModel data) => json.encode(data.toJson());
class ProfileModel {
  ProfileModel({
      this.name, 
      this.phoneNumber,});

  ProfileModel.fromJson(dynamic json) {
    name = json['name'];
    phoneNumber = json['phone_number'];
  }
  String? name;
  String? phoneNumber;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['phone_number'] = phoneNumber;
    return map;
  }

}