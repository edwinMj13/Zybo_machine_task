import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'search_results_page_event.dart';
part 'search_results_page_state.dart';

class SearchResultsPageBloc extends Bloc<SearchResultsPageEvent, SearchResultsPageState> {
  SearchResultsPageBloc() : super(SearchResultsPageInitial()) {
    on<SearchResultsPageEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
