import 'package:flutter/material.dart';
import 'package:zybo_task/features/presentation/widgets/search_widget.dart';

class SearchResultsPage extends StatelessWidget {
  const SearchResultsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
body: SafeArea(
  child: Column(
    children: [
      SizedBox(height: 20,),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SearchWidget(enabled: true),
      ),
    ],
  ),
),
    );
  }
}
