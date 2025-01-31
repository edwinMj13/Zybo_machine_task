import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zybo_task/features/presentation/pages/home_page/bloc/home_bloc.dart';
import 'package:zybo_task/features/presentation/widgets/empty_list_widget.dart';

import '../../widgets/products_grid_list_widget.dart';
import 'bloc/wishlist_bloc.dart';

class WishlistPage extends StatefulWidget {
  const WishlistPage({super.key});

  @override
  State<WishlistPage> createState() => _WishlistPageState();
}

class _WishlistPageState extends State<WishlistPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<WishlistBloc>().add(FetchWishlistEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 20,),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: buildText("Wishlist", 18),
        ),
        const SizedBox(height: 20,),
        BlocConsumer<WishlistBloc, WishlistState>(
          listener: (context,state){},
          builder: (context, state) {
            print("State $state");
            if(state is WishlistFetchSuccessState){
              return Expanded(child: ProductGridListWidget(productList: state.productList,tag: "wishlist",));
            }else{
              return EmptyListWidget();
            }
          },
        ),
      ],
    );
  }

  Widget buildText(String s, double size) =>
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(s, style: TextStyle(fontSize: size, fontWeight: FontWeight.bold,),textAlign: TextAlign.start,),
        ],
      );
}
