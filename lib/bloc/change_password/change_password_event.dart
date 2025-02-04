part of 'change_password_bloc.dart';

@immutable
abstract class ChangePasswordEvent {}

class ChangePassword extends ChangePasswordEvent {
  final PasswordModel passwordModel;

  ChangePassword({required this.passwordModel, required String currentPassword});
}
