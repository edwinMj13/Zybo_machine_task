import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:zybo_task/features/data/models/product_model.dart';
import 'package:zybo_task/features/data/services/home_services.dart';

part 'search_results_page_event.dart';
part 'search_results_page_state.dart';

class SearchResultsPageBloc extends Bloc<SearchResultsPageEvent, SearchResultsPageState> {
  SearchResultsPageBloc() : super(SearchResultsPageInitial()) {
    on<SearchResultsEvent>(searchResultsEvent);
  }
  HomeServices homeServices =HomeServices();
  Future<void> searchResultsEvent(SearchResultsEvent event, Emitter<SearchResultsPageState> emit) async {
    emit(SearchResultsLoadingState());
    final searchData = await homeServices.getSearchResults(event.query);
    final resultData = searchData.fold((fnL)=>fnL, (fnR)=>fnR);
    if(resultData is List<ProductModel>){
      if(event.query.isNotEmpty) {
        emit(SearchResultsSuccessState(searchResults: resultData));
      }else{
        emit(SearchResultsEmptyState());
      }
    }else{
      emit(SearchResultsErrorState());
    }
  }
}
