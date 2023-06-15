

import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/ProfileModel/edit_profile_model.dart';
import '../../models/ProfileModel/get_profile_model.dart';
import '../../network/repository.dart';

part 'edit_profile_screen_event.dart';
part 'edit_profile_screen_state.dart';



class EditProfilePageBloc extends Bloc<EditProfilePageEvent, EditProfilePageState> {
  final Repository repositoryRepo;

  EditProfilePageBloc(this.repositoryRepo) : super(EditProfilePageInitialState()) {

    on<EditProfilePageEvent>((event, emit) async {


      if(event is PutProfileDataEvent){
        late EditProfileModel profilePut;

        Map<String, dynamic> profilePutData ={
          'firstName': event.firstName,
          'lastName': event.lastName,
          'birthDate': event.birthDate,
          'profilePic': event.profilePic,
        };

        try{
          print("sttt5");
          emit(EditProfilePageLoadingState(true));
          print("sttt6");
          profilePut = await repositoryRepo.putEditProfileData(profilePutData);
          print("sttt7");
          print("product data here : $profilePutData");
          emit(EditProfilePageLoadingState(false));
          print("sttt8");
          emit(EditPutProfileDataState(profilePut));
          // emit(AllFetchDataForProfilePageState());
        }catch (error, stacktrace) {
          print(stacktrace);
          emit(EditProfilePageLoadingState(false));
          emit(ApiFailureState(Exception(error.toString())));
        }
      }

      if(event is FetchAllEditProfileScreenScreenAPIsEvent) {
        late GetProfileModel ProfileListModelData;

        try {
          emit(EditProfilePageLoadingState(true));
          print("print1");
          ProfileListModelData = await repositoryRepo.getProfileData();
          print("print2");
          emit(EditProfilePageLoadingState(false));
          print("ppp${ProfileListModelData}");
          emit(FetchAllEditProfileScreenAPIsEventState(ProfileListModelData));
        }
        catch(error, stacktrace) {
          print(stacktrace);
          emit(EditProfilePageLoadingState(false));
          emit(ApiFailureState(Exception(error.toString())));
        }
      }


    });

  }
}
