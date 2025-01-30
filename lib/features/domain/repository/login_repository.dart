import 'package:either_dart/either.dart';
import 'package:zybo_task/features/data/models/error_model.dart';
import 'package:zybo_task/features/data/models/login_register_model.dart';
import 'package:zybo_task/features/data/models/otp_verification_model.dart';

abstract class LoginRepository{
Future<Either<ErrorModel,OtpVerificationModel>> verifyOtp(String phNo);
Future<Either<ErrorModel,LoginRegisterModel>> loginRegisterUser(String username,String phNo);
}