
part of 'add_room_list_screen_bloc.dart';

abstract class RoomListScreenEvent {}

class RoomListScreenInitialEvent extends RoomListScreenEvent {}

class FetchAllRoomListScreenAPIsEvent extends RoomListScreenEvent {
  final String roomQuery;

  FetchAllRoomListScreenAPIsEvent(this.roomQuery);

}

class PostCreateRoomEvent extends RoomListScreenEvent{
  final String RoomLocationName;
  final String Description;
  final String HomeLocationId;

  PostCreateRoomEvent(this.RoomLocationName, this.Description,this.HomeLocationId);
}