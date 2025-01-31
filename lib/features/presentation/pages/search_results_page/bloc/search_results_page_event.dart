part of 'search_results_page_bloc.dart';

@immutable
sealed class SearchResultsPageEvent {}

class SearchResultsEvent extends SearchResultsPageEvent{
  final String query;

  SearchResultsEvent({required this.query});
}