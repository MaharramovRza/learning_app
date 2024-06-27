

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_app/pages/register/bloc/register_events.dart';
import 'package:learning_app/pages/register/bloc/register_states.dart';

class RegisterBlocs extends Bloc<RegisterEvent, RegisterStates> {

  RegisterBlocs() : super(const RegisterStates()) {
    on<UserNameChanged>((_onUserNameChanged));
    on<EmailChanged>((_onEmailChanged));
    on<PasswordChanged>((_onPasswordChanged));
    on<RePasswordChanged>((_onRePasswordChanged));
  }

  void _onUserNameChanged(
      UserNameChanged event,
      Emitter<RegisterStates> emit,
      ) {
    print("${event.username}");
    emit(state.copyWith(username: event.username));
  }

  void _onEmailChanged(
      EmailChanged event,
      Emitter<RegisterStates> emit,
      ) {
    print("${event.email}");
    emit(state.copyWith(email: event.email));
  }

  void _onPasswordChanged(
      PasswordChanged event,
      Emitter<RegisterStates> emit,
      ) {
    print("${event.password}");
    emit(state.copyWith(password: event.password));
  }

  void _onRePasswordChanged(
      RePasswordChanged event,
      Emitter<RegisterStates> emit,
      ) {
    print("${event.rePassword}");
    emit(state.copyWith(rePassword: event.rePassword));
  }


}