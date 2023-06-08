

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/CommonModel/message_model.dart';
import '../../network/repository.dart';

part 'add_item_screen_event.dart';
part 'add_item_screen_state.dart';


class ItemScreenBloc extends Bloc<ItemScreenEvent, ItemScreenState> {
  final Repository repositoryRepo;

  ItemScreenBloc(this.repositoryRepo) : super(ItemListScreenInitialState()) {
    on<ItemScreenEvent>((event, emit) async {


      if (event is PostAddItemFormEvent) {
        late MessageModel messageModelData;

        Map<String, dynamic> itemPostData = {
          'ItemName': event.ItemName,
          'Price': event.Price,
          'ShelfLocationId': event.ShelfLocationId,
          'Description': event.Description,
          'Receipt': event.Receipt,
        };

        try {
          print("sttt5");
          emit(ItemScreenLoadingEventState(true));
          print("sttt6");
          messageModelData = await repositoryRepo.addItemFormModelData(itemPostData);
          print("sttt7");
          print("itemPostData here : $itemPostData");
          emit(ItemScreenLoadingEventState(false));
          print("sttt8");
          emit(PostAddItemFormEventState(messageModelData));
          // emit(AllFetchDataForProfilePageState());
        } catch (error, stacktrace) {
          print(stacktrace);
          emit(ItemScreenLoadingEventState(false));
          emit(ApiFailureState(Exception(error.toString())));
        }
      }



    });
  }
}