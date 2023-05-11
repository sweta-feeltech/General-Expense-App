import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/ProfileModel/get_profile_model.dart';
import '../../network/repository.dart';

import '../../models/ProfileModel/get_profile_model.dart';

part 'profile_screen_event.dart';
part 'profile_screen_state.dart';


class ProfileScreenBloc extends Bloc<ProfileScreenEvent, ProfileScreenState> {
  final Repository repositoryRepo;

  ProfileScreenBloc(this.repositoryRepo) : super(ProfileScreenInitialState()) {

    on<ProfileScreenEvent>((event, emit) async {
      if(event is FetchAllProfileScreenScreenAPIsEvent) {
        late GetProfileModel ProfileListModelData;

        try {
          emit(ProfileScreenLoadingEventState(true));
          print("print1");
          ProfileListModelData = await repositoryRepo.getProfileData();
          print("print2");
          emit(ProfileScreenLoadingEventState(false));
          emit(FetchAllProfileScreenAPIsEventState(ProfileListModelData));
        }
        catch(error, stacktrace) {
          print(stacktrace);
          emit(ProfileScreenLoadingEventState(false));
          emit(ApiFailureState(Exception(error.toString())));
        }
      }
    });

  }

}