part of 'add_item_screen_bloc.dart';


@immutable

abstract class ItemScreenEvent {}

class ItemScreenListInitialEvent extends ItemScreenEvent {}


class PostAddItemFormEvent extends ItemScreenEvent {
  final String ItemName;
  final String Price;
  final String Description;
  final String ShelfLocationId;
  final File? Receipt;

  PostAddItemFormEvent(this.ItemName,this.Price,this.Description,this.ShelfLocationId,this.Receipt);
}


class FetchAllItemScreenListScreenAPIsEvent extends ItemScreenEvent {}
