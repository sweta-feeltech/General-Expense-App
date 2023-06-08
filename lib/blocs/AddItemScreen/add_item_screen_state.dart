
part of'add_item_screen_bloc.dart';


@immutable class ItemScreenState {}

class ItemListScreenInitialState extends ItemScreenState {}

class ItemScreenLoadingEventState extends ItemScreenState {
  final bool showProgress;

  ItemScreenLoadingEventState(this.showProgress);
}

class ApiFailureState extends ItemScreenState {
  final Exception exception;

  ApiFailureState(this.exception);
}

class PostAddItemFormEventState extends ItemScreenState {
  final MessageModel messageModelData;

  PostAddItemFormEventState(this.messageModelData);
}



class FetchAllListScreenAPIsEventState extends ItemScreenState {
  final List<GetHomeListModel> getHomeListModelData;
  final List<GetRoomLocationModel>  getRoomLocationModelData;
  final List<GetShelfLocationModel> getShelfLocationModelData;

  FetchAllListScreenAPIsEventState(this.getHomeListModelData,this.getRoomLocationModelData,this.getShelfLocationModelData);
}