import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:general_expense_app/models/GroupModel/single_group_view_model.dart';

import '../../models/GroupModel/group_members_model.dart';
import '../../network/repository.dart';


part 'single_group_member_screen_event.dart';
part 'single_group_member_screen_state.dart';

class SingleGroupViewScreenBloc
    extends Bloc<SingleGroupViewScreenEvent, SingleGroupViewScreenState> {
  final Repository repositoryRepo;

  SingleGroupViewScreenBloc(this.repositoryRepo)
      : super(SingleGroupViewScreenInitialState()) {
    on<SingleGroupViewScreenEvent>((event, emit) async {
      if (event is FetchAllSingleGroupViewScreenAPIsEvent) {
        late List<GroupMembersModel> getGroupMemberModelData;

        try {
          emit(SingleGroupViewScreenLoadingEventState(true));
          getGroupMemberModelData = await repositoryRepo.getGroupMemberList(event.grpQuery);
          emit(SingleGroupViewScreenLoadingEventState(false));
          emit(FetchAllSingleGroupViewScreenAPIsEventState(
              getGroupMemberModelData));
        } catch (error, stacktrace) {
          print(stacktrace);
          emit(SingleGroupViewScreenLoadingEventState(false));
          emit(ApiFailureState(Exception(error.toString())));
        }
      }
    });
  }
}
