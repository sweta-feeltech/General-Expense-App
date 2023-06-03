
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:general_expense_app/models/CommonModel/message_model.dart';
import 'package:general_expense_app/models/Locations/home_list_model.dart';
import '../../../network/repository.dart';

part 'add_home_list_screen_event.dart';
part 'add_home_list_screen_state.dart';



class HomeListScreenBloc
    extends Bloc<HomeListScreenEvent, HomeListScreenState> {
  final Repository repositoryRepo;

  HomeListScreenBloc(this.repositoryRepo)
      : super(HomeListScreenInitialState()) {
    on<HomeListScreenEvent>((event, emit) async {


      if (event is FetchAllHomeListScreenAPIsEvent) {
        late List<GetHomeListModel> getHomeListModelData;

        try {
          emit(HomeListScreenLoadingEventState(true));
          getHomeListModelData = await repositoryRepo.getHomeListData();
          emit(HomeListScreenLoadingEventState(false));
          emit(FetchAllHomeListScreenAPIsEventState(getHomeListModelData));
        } catch (error, stacktrace) {
          print(stacktrace);
          emit(HomeListScreenLoadingEventState(false));
          emit(APIFailureState(Exception(error.toString())));
        }
      }

      if (event is PostCreateHomeEvent) {
        late MessageModel messageModelData;
        try {
          messageModelData = await repositoryRepo.createHomePostAPI(
              {"HomeLocationName": event.HomeLocationName,"Description": event.Description});
          emit(PostCreateHomeEventState(messageModelData));
        } catch (error) {
          emit(HomeListScreenLoadingEventState(false));
          emit(APIFailureState(Exception(error.toString())));
        }
      }






    });
  }
}
