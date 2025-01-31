import 'dart:convert';

import 'package:either_dart/src/either.dart';
import 'package:zybo_task/features/data/local_data/local_storage.dart';
import 'package:zybo_task/features/data/models/banner_model.dart';
import 'package:zybo_task/features/data/models/error_model.dart';
import 'package:zybo_task/features/data/models/product_model.dart';
import 'package:zybo_task/features/domain/repository/home_repository.dart';

import '../local_data/constants.dart';
import 'package:http/http.dart' as http;

import '../models/login_register_model.dart';

class HomeServices implements HomeRepository {
  @override
  Future<Either<ErrorModel, List<BannerModel>>> getBannerList() async {
    // TODO: implement getBannerList
    const url = "$kBaseUrl$kBannersEndPoint";
    List<BannerModel> bannerList = [];
    try {
      final response = await http.get(Uri.parse(url));
      final json = jsonDecode(response.body);
      print("getBannerList - ${response.body}");
      if (response.statusCode == 200) {
        json.forEach((value) {
          bannerList.add(BannerModel.fromJson(value));
        });
        return Right(bannerList);
      } else {
        return Left(ErrorModel(
            status: response.statusCode.toString(), messsage: response.body));
      }
    } catch (e) {
      print("getBannerList Exception - $e");
      return Left(ErrorModel(status: "Exception", messsage: e.toString()));
    }
  }

  @override
  Future<Either<ErrorModel, List<ProductModel>>> getProductsList() async {
    // TODO: implement getProductsList
    const url = "$kBaseUrl$kProductsEndPoint";
    List<ProductModel> productList = [];
    final token = await CachedData.getUserToken();
    print("Token $token");
    try {
      final response = await http.get(Uri.parse(url),headers: {"Authorization":"Bearer $token"});
      final json = jsonDecode(response.body);
      print("getProductsList - ${response.body}");
      if (response.statusCode == 200) {
        //final data = ProductModel.fromJson(json);
        json.forEach((value) {
          productList.add(ProductModel.fromJson(value));
        });
        return Right(productList);
      } else {
        return Left(ErrorModel(
            status: response.statusCode.toString(), messsage: response.body));
      }
    } catch (e) {
      print("getProductsList Exception - $e");
      return Left(ErrorModel(status: "Exception", messsage: e.toString()));
    }
  }

  @override
  Future<Either<ErrorModel, List<ProductModel>>> getSearchResults(String query) async {
    // TODO: implement getSearchResults
    const url = "$kBaseUrl$kSearchEndPoint";
    List<ProductModel> productList = [];
    try {
      final response = await http.post(Uri.parse(url),body: {"query":query});
      final json = jsonDecode(response.body);
      print("getSearchResults - ${response.body}");
      if (response.statusCode == 200) {
        //final data = ProductModel.fromJson(json);
        json.forEach((value) {
          productList.add(ProductModel.fromJson(value));
        });
        return Right(productList);
      } else {
        return Left(ErrorModel(
            status: response.statusCode.toString(), messsage: response.body));
      }
    } catch (e) {
      print("getSearchResults Exception - $e");
      return Left(ErrorModel(status: "Exception", messsage: e.toString()));
    }
  }
}
