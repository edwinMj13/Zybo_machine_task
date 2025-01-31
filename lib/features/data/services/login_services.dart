import 'dart:convert';

import 'package:either_dart/src/either.dart';
import 'package:zybo_task/features/data/models/error_model.dart';
import 'package:zybo_task/features/data/models/login_register_model.dart';
import 'package:zybo_task/features/data/models/otp_verification_model.dart';
import 'package:zybo_task/features/domain/repository/login_repository.dart';
import 'package:http/http.dart' as http;

import '../local_data/constants.dart';

class LoginServices implements LoginRepository{
  @override
  Future<Either<ErrorModel, LoginRegisterModel>> loginRegisterUser(String username, String phNo) async {
    // TODO: implement loginRegisterUser
    const url = "$kBaseUrl$kLoginRegisterEndPoint";
    try{
      final response = await http.post(Uri.parse(url),body: { "phone_number": phNo,"first_name":username });
      final json = jsonDecode(response.body);
      print("loginRegisterUser - ${response.body}");
      if(response.statusCode>=200 && response.statusCode<300){
        final data = LoginRegisterModel.fromJson(json);
        return Right(data);
      }else{
        return Left(ErrorModel(status: response.statusCode.toString(), messsage: response.body));
      }
    }catch(e){
      print("verifyOtp Exception - $e");
      return Left(ErrorModel(status: "Exception", messsage: e.toString()));
    }
  }

  @override
  Future<Either<ErrorModel, OtpVerificationModel>> verifyOtp(String phNo) async {
    // TODO: implement verifyOtp
    const url = "$kBaseUrl$kVerifyOtpEndPoint";
    try{
      final response = await http.post(Uri.parse(url),body: { "phone_number": phNo, });
      final json = jsonDecode(response.body);
      print(" verifyOtp - Response - ${response.body}");
      if(response.statusCode>=200 && response.statusCode<300){
        final data = OtpVerificationModel.fromJson(json);
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