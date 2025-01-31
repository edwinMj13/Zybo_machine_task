import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zybo_task/features/data/models/product_model.dart';
import 'package:zybo_task/features/presentation/pages/wishlist_page/bloc/wishlist_bloc.dart';

import '../pages/home_page/bloc/home_bloc.dart';

class ProductGridListWidget extends StatelessWidget {
  const ProductGridListWidget({
    super.key,
    required this.productList,
    required this.tag,
  });

  final List<ProductModel> productList;
  final String tag;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(20),
      //physics: NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 0.9,
      ),
      itemCount: productList.length,
      itemBuilder: (context, index) {
        print(productList[index].inWishlist);
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            // boxShadow: [
            //   BoxShadow(
            //     color: Colors.grey.withOpacity(0.2),
            //     blurRadius: 5,
            //     spreadRadius: 2,
            //   ),
            // ],
          ),
          //padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      productList[index].featuredImage!,
                      width: double.infinity,
                      height: 140,

                     /* loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Center(
                          child: CircularProgressIndicator(
                            value: loadingProgress.expectedTotalBytes != null
                                ? loadingProgress.cumulativeBytesLoaded / (loadingProgress.expectedTotalBytes ?? 1)
                                : null,
                          ),
                        );
                      },
                      errorBuilder: (context, error, stackTrace) {
                        return Icon(Icons.image,size: 100,);
                      },*/
                      fit: BoxFit.cover,
                    ),
                  ),
                  tag != "search" ?Positioned(
                    top: 10,
                    right: 10,
                    child: InkWell(
                      onTap: (){
                        if(tag=="home") {
                          context.read<HomeBloc>().add(HomeAddRemWishListEvent(
                              id: productList[index].id!, context: context));
                        }else{
                          context.read<WishlistBloc>().add(WishlistAddRemEvent(
                              id: productList[index].id!, context: context));
                        }
                      },
                      child: Icon(Icons.favorite,shadows: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 10,
                          spreadRadius: 2,
                        ),
                      ],
                          color: productList[index].inWishlist == true
                              ? Colors.blue
                              : Colors.white),
                    ),
                  ):SizedBox(),
                ],
              ),
              const SizedBox(height: 8),
              const SizedBox(height: 4),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              "₹${productList[index].mrp!}",
                              style: const TextStyle(
                                decoration: TextDecoration.lineThrough,
                                color: Colors.grey,
                              ),
                            ),
                            const SizedBox(width: 5),
                            Text(
                              "₹${productList[index].salePrice}",
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.purple,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const Icon(Icons.star,
                                color: Colors.yellow, size: 18),
                            Text(productList[index].avgRating.toString()),
                          ],
                        ),
                      ],
                    ),
                    Text(
                      productList[index].name!,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 14),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
