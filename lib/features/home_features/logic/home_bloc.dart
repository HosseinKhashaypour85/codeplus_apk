import 'package:bloc/bloc.dart';
import 'package:codeplus/features/home_features/model/home_model.dart';
import 'package:codeplus/features/home_features/services/home_api_repository.dart';
import 'package:codeplus/features/public_features/functions/error/error_message_class.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

import '../../public_features/functions/error/error_exception.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeApiRepository repository;
  HomeBloc(this.repository) : super(HomeInitial()) {
    on<CallHomeEvent>((event, emit) async{
      emit(HomeLoadingState());
      try{
        HomeModel homeModel = await repository.callHomeApi();
        emit(HomeCompletedState(homeModel: homeModel));
      }
          on DioException catch(e){
            emit(HomeErrorState(
                error: ErrorMessageClass(errorMsg: ErrorExceptions().fromError(e))));
          }
    });
  }
}
