
part of 'item_list_screen_bloc.dart';



abstract class ItemListScreenEvent {}

class ItemListScreenInitialEvent extends ItemListScreenEvent {}

class FetchAllItemListScreenAPIsEvent extends ItemListScreenEvent {
  final String ItemQuery;

  FetchAllItemListScreenAPIsEvent(this.ItemQuery);
}

