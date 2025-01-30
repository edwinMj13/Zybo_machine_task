import 'package:either_dart/either.dart';
import 'package:zybo_task/features/data/models/banner_model.dart';
import 'package:zybo_task/features/data/models/error_model.dart';
import 'package:zybo_task/features/data/models/product_model.dart';

abstract class HomeRepository{
  Future<Either<ErrorModel,List<ProductModel>>> getProductsList();
  Future<Either<ErrorModel,List<BannerModel>>> getBannerList();
}