import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:general_expense_app/models/GroupModel/add_group_model.dart';

import '../../models/GroupModel/group_list_model.dart';
import '../../network/repository.dart';

part 'group_list_screen_event.dart';
part 'group_list_screen_state.dart';

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
          emit(FetchAllGroupListScreenAPIsEventState(getGroupListModelData));
        } catch (error, stacktrace) {
          print(stacktrace);
          emit(GroupListScreenLoadingEventState(false));
          emit(APIFailureState(Exception(error.toString())));
        }
      }

      if (event is PostCreateGroupEvent) {
        late AddGroupModel addGroupModelData;

        try {
          addGroupModelData = await repositoryRepo.createGroupPostAPI(
              {"GroupName": event.GroupName, "Description": event.Description});

          emit(PostCreateGroupEventState(addGroupModelData));
        } catch (error) {
          emit(GroupListScreenLoadingEventState(false));
          emit(APIFailureState(Exception(error.toString())));
        }
      }

      if (event is PostJoinGroupEvent) {
        late AddGroupModel addGroupModelData;

        try {
          addGroupModelData = await repositoryRepo
              .joinGroupPostAPI({"pin": event.pin, "MemberId": event.MemberId});

          emit(PostJoinGroupEventState(addGroupModelData));
        } catch (error) {
          emit(GroupListScreenLoadingEventState(false));
          emit(APIFailureState(Exception(error.toString())));
        }
      }

      if (event is DeleteGroupEvent) {
        late AddGroupModel addGroupModelDAta1;
        try {
          emit(GroupListScreenLoadingEventState(true));
          addGroupModelDAta1 = await repositoryRepo.delGroupData(id: event.id!);
          emit(GroupListScreenLoadingEventState(false));
          emit(DeleteGroupState(addGroupModelDAta1));
        } catch (error, stacktrace) {
          print("stacktrave: $stacktrace");
          emit(GroupListScreenLoadingEventState(false));
          emit(APIFailureState(Exception(error.toString())));
        }
      }
    });
  }
}
