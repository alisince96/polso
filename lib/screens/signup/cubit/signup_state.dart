part of 'signup_cubit.dart';

@immutable
abstract class SignupState {}

class SignupInitial extends SignupState {}

class SignupLoading extends SignupState {}

class VerificationCompleted extends SignupState {}

class LoggedInSuccess extends SignupState {}

class OtpError extends SignupState {
  final String error;
  OtpError({this.error = ''});
}

class OtpSent extends SignupState {
  final String? verificationId;
  OtpSent({this.verificationId});
}

class OtpVerified extends SignupState {}

class SignupError extends SignupState {
  final String error;
  SignupError({this.error = ''});
}

class RegisterationSuccessAndLoggedIn extends SignupState {}

class RegisterationSuccessAndNotLoggedIn extends SignupState {}
