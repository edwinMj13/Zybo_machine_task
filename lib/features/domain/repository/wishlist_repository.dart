import 'package:either_dart/either.dart';
import 'package:zybo_task/features/data/models/wishlist_add_rem_model.dart';

import '../../data/models/error_model.dart';
import '../../data/models/product_model.dart';

abstract class WishlistRepository{
  Future<Either<ErrorModel,WishlistAddRemModel>> addRemWishlist(int id);
  Future<Either<ErrorModel,List<ProductModel>>> getWishlist();
}