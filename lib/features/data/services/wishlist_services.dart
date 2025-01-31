import 'dart:convert';

import 'package:either_dart/src/either.dart';
import 'package:zybo_task/features/data/models/error_model.dart';
import 'package:zybo_task/features/data/models/product_model.dart';
import 'package:zybo_task/features/data/models/wishlist_add_rem_model.dart';
import 'package:zybo_task/features/domain/repository/wishlist_repository.dart';

import '../local_data/constants.dart';
import '../local_data/local_storage.dart';

import 'package:http/http.dart' as http;

class WishlistServices implements WishlistRepository{
  @override
  Future<Either<ErrorModel, WishlistAddRemModel>> addRemWishlist(int id) async {
    // TODO: implement getProfileDetails
    const url = "$kBaseUrl$kAddRemWishlistEndPoint";
    final token = await CachedData.getUserToken();
    print("Token $token");
    try{
      final response = await http.post(Uri.parse(url),headers: {
        "Authorization": "Bearer $token",
       // "Content-Type": "application/json",
      },
      body: {"product_id":id.toString()});
      final json = jsonDecode(response.body);
      print("addRemWishlist - ${response.statusCode}");
      if(response.statusCode>=200 && response.statusCode<300){
        final data = WishlistAddRemModel.fromJson(json);
        return Right(data);
      }else{
        return Left(ErrorModel(status: response.statusCode.toString(), messsage: response.body));
      }
    }catch(e){
      print("addRemWishlist Exception - $e");
      return Left(ErrorModel(status: "Exception", messsage: e.toString()));
    }
  }

  @override
  Future<Either<ErrorModel, List<ProductModel>>> getWishlist() async {
    // TODO: implement getWishlist
    const url = "$kBaseUrl$kWishlistEndPoint";
    List<ProductModel> wishList = [];
    final token = await CachedData.getUserToken();
    try{
      final response = await http.get(Uri.parse(url),headers: {
        "Authorization": "Bearer $token",
        "Content-Type": "application/json",});
      final json = jsonDecode(response.body);
      print("getWishlist - ${response.statusCode}");
      if(response.statusCode>=200 && response.statusCode<300){
        json.forEach((value) {
          wishList.add(ProductModel.fromJson(value));
        });
        return Right(wishList);
      }else{
        return Left(ErrorModel(status: response.statusCode.toString(), messsage: response.body));
      }
    }catch(e){
      print("getWishlist Exception - $e");
      return Left(ErrorModel(status: "Exception", messsage: e.toString()));
    }
  }

}