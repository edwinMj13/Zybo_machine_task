part of 'search_results_page_bloc.dart';

@immutable
sealed class SearchResultsPageState {}

final class SearchResultsPageInitial extends SearchResultsPageState {}

class SearchResultsSuccessState extends SearchResultsPageState{
  final List<ProductModel> searchResults;

  SearchResultsSuccessState({required this.searchResults});
}

class SearchResultsLoadingState extends SearchResultsPageState{}

class SearchResultsErrorState extends SearchResultsPageState{}

class SearchResultsEmptyState extends SearchResultsPageState{}