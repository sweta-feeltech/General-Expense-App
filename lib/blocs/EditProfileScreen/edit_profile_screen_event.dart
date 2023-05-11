
part of 'edit_profile_screen_bloc.dart';



abstract class EditProfilePageEvent{}

class EditProfilePageInitialEvent extends EditProfilePageEvent{}

// class AllFetchDataForProfilePageEvent extends EditProfilePageEvent{}


class PutProfileDataEvent extends EditProfilePageEvent {

  final String? firstName, lastName, email, dob,description;

  final File? profilePic;

  PutProfileDataEvent(
      this.firstName,
      this.lastName,
      this.email,
      this.dob,
      this.description,
      {this.profilePic}
      );

}
