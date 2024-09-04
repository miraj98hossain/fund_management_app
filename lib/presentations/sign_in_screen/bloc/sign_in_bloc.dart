import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

sealed class SignInEvent {}

class SignIn extends SignInEvent {
  final String email;
  final String password;
  SignIn({required this.email, required this.password});
}

sealed class SignInState {}

final class SignInInitial extends SignInState {}

final class SignInLoading extends SignInState {}

final class SignInSuccess extends SignInState {}

final class SignInError extends SignInState {
  final Object error;

  SignInError({required this.error});
}

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInInitial()) {
    on<SignIn>((event, emit) async {
      emit(SignInLoading());
      if (event.email == 'admin' && event.password == '1234') {
        await Future.delayed(const Duration(seconds: 1), () {
          emit(SignInSuccess());
        });
      } else {
        await Future.delayed(const Duration(seconds: 1), () {
          emit(SignInError(error: 'Invalid credentials'));
        });
      }
    });
  }
}
