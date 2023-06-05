
part of 'add_shelf_list_screen_bloc.dart';

abstract class ShelfListScreenEvent {}

class shelfListScreenInitialEvent extends ShelfListScreenEvent {}

class FetchAllShelfListScreenAPIsEvent extends ShelfListScreenEvent {
  final String shelfQuery;

  FetchAllShelfListScreenAPIsEvent(this.shelfQuery);

}

class PostCreateShelfEvent extends ShelfListScreenEvent{
  final String shelfLocationName;
  final String Description;
  final String RoomLocationId;

  PostCreateShelfEvent(this.shelfLocationName, this.Description,this.RoomLocationId);
}