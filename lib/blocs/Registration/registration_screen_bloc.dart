
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/LoginRegisterModel/login_model.dart';
import '../../network/repository.dart';

part 'registration_screen_event.dart';
part 'registration_screen_state.dart';


class RegistrationScreenBloc extends Bloc<RegistrationScreenEvent, RegistrationScreenState> {
  final Repository repositaryRepo;

  RegistrationScreenBloc(this.repositaryRepo) : super(RegistrationScreenInitialState()){
    on<RegistrationScreenEvent>((event, emit) async {

      if(event is PostRegistrationDataEvent) {
        late LoginModel loginModelData;

        try {
          emit(RegistrationScreenLoadingState(true));
          loginModelData = await repositaryRepo.registrationPostAPI('user', {"firstName": event.firstName,"lastName": event.lastName,"email": event.email, "password": event.passWord});
          emit(RegistrationScreenLoadingState(false));
          emit(PostRegistrationDataEventState(loginModelData));
        } catch (error, stacktrace) {
          emit(RegistrationScreenLoadingState(false));
          emit(APIFailureState(Exception(error.toString())));
        }
      }


    });
  }
}

