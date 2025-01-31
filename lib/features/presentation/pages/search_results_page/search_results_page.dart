import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zybo_task/config/utils.dart';
import 'package:zybo_task/features/presentation/widgets/products_grid_list_widget.dart';
import 'package:zybo_task/features/presentation/widgets/search_widget.dart';

import '../../widgets/empty_list_widget.dart';
import 'bloc/search_results_page_bloc.dart';

class SearchResultsPage extends StatefulWidget {
  const SearchResultsPage({super.key});

  @override
  State<SearchResultsPage> createState() => _SearchResultsPageState();
}

class _SearchResultsPageState extends State<SearchResultsPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: SearchWidget(enabled: true),
            ),
            BlocConsumer<SearchResultsPageBloc, SearchResultsPageState>(
              listener: (context,state){
                if(state is SearchResultsErrorState){
                  Utils.snackbarUtils(context, "Something Wrong...!", Colors.red);
                }
              },
              builder: (context, state) {
                if(state is SearchResultsSuccessState){
                  return Expanded(
                      child: ProductGridListWidget(productList: state.searchResults,tag: "search"));
                }else if(state is SearchResultsPageInitial || state is SearchResultsEmptyState){
                  return EmptyListWidget();
                }else if(state is SearchResultsLoadingState){
                  return CircularProgressIndicator();
                }else {
                  return SizedBox();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

