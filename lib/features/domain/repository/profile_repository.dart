import 'package:either_dart/either.dart';
import 'package:zybo_task/features/data/models/error_model.dart';
import 'package:zybo_task/features/data/models/profile_model.dart';

abstract class ProfileRepository{
  Future<Either<ErrorModel,ProfileModel>> getProfileDetails();
}