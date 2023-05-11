import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/LoginRegisterModel/login_model.dart';
import '../../network/repository.dart';

part 'login_screen_event.dart';
part 'login_screen_state.dart';

class LoginScreenBloc extends Bloc<LoginScreenEvent, LoginScreenState> {
  late LoginModel loginData;
  final Repository repositaryRepo;

  LoginScreenBloc(this.repositaryRepo) : super(LoginScreenInitialState()){
    on<LoginScreenEvent>((event, emit) async {

      if(event is PostLoginDataEvent) {
        // late UserProfileData userProfileData;
        try {
          emit(LoginScreenLoadingState(true));
          loginData = await repositaryRepo.loginPostAPI('Authentication/login', {"email": event.email, "password": event.passWord});
          // userProfileData = await repositaryRepo.getUserDataForProfile('profile');
          emit(LoginScreenLoadingState(false));
          emit(PostLoginDataEventState(loginData));
        } catch (error, stacktrace) {
          emit(LoginScreenLoadingState(false));
          emit(APIFailureState(Exception(error.toString())));
        }
      }


    });
  }
}

