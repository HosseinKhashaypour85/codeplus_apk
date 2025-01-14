import 'package:bloc/bloc.dart';
import 'package:codeplus/features/home_features/model/home_model.dart';
import 'package:codeplus/features/public_features/functions/error/error_message_class.dart';
import 'package:codeplus/features/search_features/model/search_model.dart';
import 'package:codeplus/features/search_features/services/search_api_repository.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

import '../../public_features/functions/error/error_exception.dart';

part 'search_event.dart';

part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchApiRepository repository;

  SearchBloc(this.repository) : super(SearchInitial()) {
    on<CallSearchEvent>((event, emit) async {
      emit(SearchLoadingState());
      try {
        final SearchModel searchModel = await repository.callSearchApi();
        emit(SearchCompletedState(searchModel: searchModel));
      } on DioException catch(e) {
        emit(SearchErrorState(
            error: ErrorMessageClass(
                errorMsg: ErrorExceptions().fromError(e))));
      }});
  }
}
