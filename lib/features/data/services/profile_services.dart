import 'dart:convert';

import 'package:either_dart/src/either.dart';
import 'package:zybo_task/features/data/local_data/local_storage.dart';
import 'package:zybo_task/features/data/models/error_model.dart';
import 'package:zybo_task/features/data/models/profile_model.dart';
import 'package:zybo_task/features/domain/repository/profile_repository.dart';

import '../local_data/constants.dart';
import 'package:http/http.dart' as http;

class ProfileServices implements ProfileRepository{
  @override
  Future<Either<ErrorModel, ProfileModel>> getProfileDetails() async{
    // TODO: implement getProfileDetails
    const url = "$kBaseUrl$kUserDataEndPoint";
    final token = await CachedData.getUserToken();
    try{
      final response = await http.get(Uri.parse(url),headers: {
        "Authorization": "Bearer $token",
        "Content-Type": "application/json",});
      final json = jsonDecode(response.body);
      print("loginRegisterUser - ${response.body}");
      if(response.statusCode==200){
        final data = ProfileModel.fromJson(json);
        return Right(data);
      }else{
        return Left(ErrorModel(status: response.statusCode.toString(), messsage: response.body));
      }
    }catch(e){
      print("verifyOtp Exception - $e");
      return Left(ErrorModel(status: "Exception", messsage: e.toString()));
    }
  }

}