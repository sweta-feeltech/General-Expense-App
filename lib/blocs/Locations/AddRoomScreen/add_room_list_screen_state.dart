part of 'add_room_list_screen_bloc.dart';

@immutable
abstract class RoomListScreenState {}

class RoomListScreenInitialState extends RoomListScreenState {}

class RoomListScreenLoadingEventState extends RoomListScreenState {
  final bool showProgress;

  RoomListScreenLoadingEventState(this.showProgress);
}

class APIFailureState extends RoomListScreenState {
  final Exception exception;

  APIFailureState(this.exception);
}



class FetchAllRoomListScreenAPIsEventState extends RoomListScreenState {
  final List<GetRoomListModel> getRoomListModelData;

  FetchAllRoomListScreenAPIsEventState(this.getRoomListModelData);
}

class PostCreateRoomEventState extends RoomListScreenState{
  final MessageModel messageModelData;

  PostCreateRoomEventState(this.messageModelData);
}
