part of 'edit_profile_screen_bloc.dart';

abstract class EditProfilePageState{}

class EditProfilePageInitialState extends EditProfilePageState{}

class EditProfilePageLoadingState extends  EditProfilePageState{
  final bool showProgress;
  EditProfilePageLoadingState(this.showProgress);
}

class FetchAllEditProfileScreenAPIsEventState extends EditProfilePageState {
  final GetProfileModel getProfileModelData;

  FetchAllEditProfileScreenAPIsEventState(this.getProfileModelData);
}


class EditPutProfileDataState extends EditProfilePageState{
  EditProfileModel editProfileModelResponse;
  EditPutProfileDataState(this.editProfileModelResponse);
}

class ApiFailureState extends EditProfilePageState{
  final Exception exception;
  ApiFailureState(this.exception);
}

