import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zybo_task/features/data/models/banner_model.dart';
import 'package:zybo_task/features/presentation/widgets/search_widget.dart';
import 'package:zybo_task/features/presentation/widgets/products_grid_list_widget.dart';

import '../../../../config/routes/route_names.dart';
import '../../../domain/use_cases/home_cases.dart';
import 'bloc/home_bloc.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<HomeBloc>().add(HomeLoadEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 25,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: InkWell(onTap: ()=>HomeCases.navigateToSearchPage(context),
              child: SearchWidget(enabled: false,)),
        ),
        const SizedBox(
          height: 25,
        ),
        BlocConsumer<HomeBloc, HomeState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            if (state is HomeDataSuccessState) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BannerSlider(
                    bannerList: state.bannerList,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              );
            } else {
              return SizedBox();
            }
          },
        ),
        Expanded(
          child: BlocConsumer<HomeBloc, HomeState>(
            listener: (context, state) {
              // TODO: implement listener
            },
            builder: (context, state) {
              if (state is HomeDataSuccessState) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: Text(
                        "Popular Product",
                        style: TextStyle(fontSize: 17, color: Colors.black),
                      ),
                    ),
                    Expanded(
                      child: ProductGridListWidget(productList: state.productList),
                    )
                  ],
                );
              } else {
                return SizedBox();
              }
            },
          ),
        )
      ],
    );
  }
}

class BannerSlider extends StatelessWidget {
  const BannerSlider({
    super.key,
    required this.bannerList,
  });

  final List<BannerModel> bannerList;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
        items: List.generate(bannerList.length, (index) {
          return ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                bannerList[index].image!,
              ));
        }),
        options: CarouselOptions(
          enlargeCenterPage: true,
          aspectRatio: 2.5,
          viewportFraction: 0.9,
        ));
  }
}
