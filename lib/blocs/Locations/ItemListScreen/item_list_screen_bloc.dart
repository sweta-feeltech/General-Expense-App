

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/Locations/Item_list_model.dart';
import '../../../network/repository.dart';

part 'item_list_screen_event.dart';
part 'item_list_screen_state.dart';


class ItemListScreenBloc
    extends Bloc<ItemListScreenEvent, ItemListScreenState> {
  final Repository repositoryRepo;

  ItemListScreenBloc(this.repositoryRepo)
      : super(ItemListScreenInitialState()) {
    on<ItemListScreenEvent>((event, emit) async {


      if (event is FetchAllItemListScreenAPIsEvent) {
        late List<GetItemListModel> getItemListModelData;

        try {
          emit(ItemListScreenLoadingEventState(true));
          getItemListModelData = await repositoryRepo.getItemListData(event.ItemQuery);
          emit(ItemListScreenLoadingEventState(false));
          emit(FetchAllItemListScreenAPIsEventState(getItemListModelData));
        } catch (error, stacktrace) {
          print(stacktrace);
          emit(ItemListScreenLoadingEventState(false));
          emit(APIFailureState(Exception(error.toString())));
        }
      }








    });
  }
}
