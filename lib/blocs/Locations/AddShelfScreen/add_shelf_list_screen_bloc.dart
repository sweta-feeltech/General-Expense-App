import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/CommonModel/message_model.dart';
import '../../../models/Locations/shelf_list_model.dart';
import '../../../network/repository.dart';

part 'add_shelf_list_screen_event.dart';
part 'add_shelf_list_screen_state.dart';


class ShelfListScreenBloc
    extends Bloc<ShelfListScreenEvent, ShelfListScreenState> {
  final Repository repositoryRepo;

  ShelfListScreenBloc(this.repositoryRepo)
      : super(ShelfListScreenInitialState()) {
    on<ShelfListScreenEvent>((event, emit) async {


      if (event is FetchAllShelfListScreenAPIsEvent) {
        late List<GetShelfListModel> getShelfListModelData;

        try {
          emit(ShelfListScreenLoadingEventState(true));
          getShelfListModelData = await repositoryRepo.getShelfListData(event.shelfQuery);
          emit(ShelfListScreenLoadingEventState(false));
          emit(FetchAllShelfListScreenAPIsEventState(getShelfListModelData));
        } catch (error, stacktrace) {
          print(stacktrace);
          emit(ShelfListScreenLoadingEventState(false));
          emit(APIFailureState(Exception(error.toString())));
        }
      }

      if (event is PostCreateShelfEvent) {
        late MessageModel messageModelData;
        try {
          messageModelData = await repositoryRepo.createShelfPostAPI(
              {"ShelfLocationName": event.shelfLocationName,
                "Description": event.Description,
                "RoomLocationId":event.RoomLocationId,
              });
          emit(PostCreateShelfEventState(messageModelData));
        } catch (error) {
          emit(ShelfListScreenLoadingEventState(false));
          emit(APIFailureState(Exception(error.toString())));
        }
      }






    });
  }
}
