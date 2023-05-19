import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:general_expense_app/models/GroupModel/single_group_view_model.dart';

import '../../network/repository.dart';


part 'single_course_view_screen_event.dart';
part 'single_course_view_screen_state.dart';

class SingleGroupViewScreenBloc
    extends Bloc<SingleGroupViewScreenEvent, SingleGroupViewScreenState> {
  final Repository repositoryRepo;

  SingleGroupViewScreenBloc(this.repositoryRepo)
      : super(SingleGroupViewScreenInitialState()) {
    on<SingleGroupViewScreenEvent>((event, emit) async {
      if (event is FetchAllSingleGroupViewScreenAPIsEvent) {
        late List<SingleGroupViewModel> singleGroupViewModelData;

        try {
          emit(SingleGroupViewScreenLoadingEventState(true));
          singleGroupViewModelData = await repositoryRepo.getSingleGroupViewList(event.grpQuery);
          emit(SingleGroupViewScreenLoadingEventState(false));
          emit(FetchAllSingleGroupViewScreenAPIsEventState(
              singleGroupViewModelData));
        } catch (error, stacktrace) {
          print(stacktrace);
          emit(SingleGroupViewScreenLoadingEventState(false));
          emit(ApiFailureState(Exception(error.toString())));
        }
      }
    });
  }
}
