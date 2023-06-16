
part of 'edit_profile_screen_bloc.dart';



abstract class EditProfilePageEvent{}

class EditProfilePageInitialEvent extends EditProfilePageEvent{}


class FetchAllEditProfileScreenScreenAPIsEvent extends EditProfilePageEvent {}


class PutProfileDataEvent extends EditProfilePageEvent {

  final String? firstName, lastName, birthDate,bio;

  final File? profilePic;

  PutProfileDataEvent(
      this.firstName,
      this.lastName,
      this.birthDate,
      this.bio,
      {this.profilePic}
      );

}
