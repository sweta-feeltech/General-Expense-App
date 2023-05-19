import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/GroupModel/group_list_model.dart';
import '../../network/repository.dart';


part 'group_screen_event.dart';
part 'group_screen_state.dart';

class GroupListScreenBloc
    extends Bloc<GroupListScreenEvent, GroupListScreenState> {
  final Repository repositoryRepo;

  GroupListScreenBloc(this.repositoryRepo)
      : super(GroupListScreenInitialState()) {
    on<GroupListScreenEvent>((event, emit) async {
      if (event is FetchAllGroupListScreenAPIsEvent) {
        late List<GetGroupListModel> getGroupListModelData;

        try {
          emit(GroupListScreenLoadingEventState(true));
          getGroupListModelData = await repositoryRepo.getGroupModelData();
          emit(GroupListScreenLoadingEventState(false));
          emit(FetchAllGroupListScreenAPIsEventState(
              getGroupListModelData));
        } catch (error, stacktrace) {
          print(stacktrace);
          emit(GroupListScreenLoadingEventState(false));
          emit(ApiFailureState(Exception(error.toString())));
        }
      }
    });
  }
}
