

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/CommonModel/message_model.dart';
import '../../../models/Locations/room_list_model.dart';
import '../../../network/repository.dart';

part 'add_room_list_screen_event.dart';
part 'add_room_list_screen_state.dart';





class RoomListScreenBloc
    extends Bloc<RoomListScreenEvent, RoomListScreenState> {
  final Repository repositoryRepo;

  RoomListScreenBloc(this.repositoryRepo)
      : super(RoomListScreenInitialState()) {
    on<RoomListScreenEvent>((event, emit) async {


      if (event is FetchAllRoomListScreenAPIsEvent) {
        late List<GetRoomListModel> getRoomListModelData;

        try {
          emit(RoomListScreenLoadingEventState(true));
          getRoomListModelData = await repositoryRepo.getRoomListData(event.roomQuery);
          emit(RoomListScreenLoadingEventState(false));
          emit(FetchAllRoomListScreenAPIsEventState(getRoomListModelData));
        } catch (error, stacktrace) {
          print(stacktrace);
          emit(RoomListScreenLoadingEventState(false));
          emit(APIFailureState(Exception(error.toString())));
        }
      }

      if (event is PostCreateRoomEvent) {
        late MessageModel messageModelData;
        try {
          messageModelData = await repositoryRepo.createRoomPostAPI(
              {"RoomLocationName": event.RoomLocationName,"Description": event.Description,"HomeLocationId":event.HomeLocationId});
          emit(PostCreateRoomEventState(messageModelData));
        } catch (error) {
          emit(RoomListScreenLoadingEventState(false));
          emit(APIFailureState(Exception(error.toString())));
        }
      }






    });
  }
}
