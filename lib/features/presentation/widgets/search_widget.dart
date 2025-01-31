import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zybo_task/config/routes/route_names.dart';
import 'package:zybo_task/features/presentation/pages/search_results_page/bloc/search_results_page_bloc.dart';

class SearchWidget extends StatelessWidget {
   SearchWidget({
    super.key,
    //required this.searchController,
    required this.enabled,
  });

  final bool enabled;

  final  searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: searchController,
                enabled: enabled,
                autofocus: enabled==true?true:false,
                decoration: const InputDecoration(
                  hintText: "Search",
                  hintStyle: TextStyle(fontSize: 14),
                  border: InputBorder.none,
                ),
                onChanged: (value){
                    context.read<SearchResultsPageBloc>().add(
                        SearchResultsEvent(query: value));
                },
              ),
            ),
            const SizedBox(
              height: 30,
              child: VerticalDivider(
                color: Colors.grey,
                thickness: 1,
                indent: 5,
                endIndent: 0,
                width: 20,
              ),
            ),
            //SizedBox(width: 10,),
            const Icon(CupertinoIcons.search)
           // searchController.text == "" ? const Icon(CupertinoIcons.search) :IconButton(onPressed: ()=>searchController.clear, icon: Icon(Icons.close)),
          ],
        ),
      ),
    );
  }
}
