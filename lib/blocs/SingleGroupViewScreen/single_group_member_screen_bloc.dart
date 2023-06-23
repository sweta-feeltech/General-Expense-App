import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

        late List<GroupMembersModel> groupMembersModelData;

        try {
          print("ldst1");

          emit(SingleGroupViewScreenLoadingEventState(true));
          print("ldst2");

          groupMembersModelData = await repositoryRepo.getGroupMemberList(event.grpQuery);


          print("ldst3");

          emit(SingleGroupViewScreenLoadingEventState(false));
          print("ldst4");
          emit(FetchAllSingleGroupViewScreenAPIsEventState(
              groupMembersModelData));
          print("ldst5");

        } catch (error, stacktrace) {
          print(stacktrace);
          emit(SingleGroupViewScreenLoadingEventState(false));
          emit(ApiFailureState(Exception(error.toString())));
        }
      }

      //
      // if (event is FetchAllSingleGroupLinkScreenAPIsEvent) {
      //   GroupLinkModel? groupLinkModeldata;
      //
      //   try {
      //     emit(SingleGroupViewScreenLoadingEventState(true));
      //     groupLinkModeldata = await repositoryRepo.getGroupLinkData(event.lnkQuery);
      //     emit(SingleGroupViewScreenLoadingEventState(false));
      //     emit(FetchAllSingleGroupLinkScreenAPIsEventState(
      //         groupLinkModeldata));
      //   } catch (error, stacktrace) {
      //     print(stacktrace);
      //     emit(SingleGroupViewScreenLoadingEventState(false));
      //     emit(ApiFailureState(Exception(error.toString())));
      //   }
      // }




    });
  }
}
