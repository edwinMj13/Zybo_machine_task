import 'package:flutter/material.dart';
import 'package:zybo_task/features/data/models/product_model.dart';

class ProductGridListWidget extends StatelessWidget {
  const ProductGridListWidget({super.key,required this.productList});
final List<ProductModel> productList;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(20),
      //physics: NeverScrollableScrollPhysics(),
      gridDelegate:
      const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 0.9,
      ),
      itemCount: productList.length,
      itemBuilder: (context, index) {
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
                      fit: BoxFit.cover,
                    ),
                  ),
                  const Positioned(
                    top: 10,
                    right: 10,
                    child: Icon(Icons.favorite,
                        color: Colors.red),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              const SizedBox(height: 4),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 5.0),
                child: Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              "₹${productList[index].mrp!}",
                              style: const TextStyle(
                                decoration: TextDecoration
                                    .lineThrough,
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
                                color: Colors.yellow,
                                size: 18),
                            Text(productList[index].avgRating
                                .toString()),
                          ],
                        ),
                      ],
                    ),
                    Text(productList[index].name!,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14),
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
