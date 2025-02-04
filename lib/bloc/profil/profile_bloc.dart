import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:safetycheck/data/datasources/auth_datasources.dart';

import 'package:meta/meta.dart';

import '../../data/models/response/profil_response_model.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final AuthDatasource authDatasource;
  ProfileBloc(
    this.authDatasource,
  ) : super(ProfileInitial()) {
    on<GetProfileEvent>((event, emit) async {
      try {
        emit(ProfileLoading());
        final result = await authDatasource.getProfile();
        emit(ProfileLoaded(profile: result));
      } catch (e) {
        emit(ProfileError(message: 'network problem: ${e.toString()}'));
      }
    });

    on<EditProfileEvent>((event, emit) async {
      try {
        emit(ProfileLoading());

        final result = await authDatasource.editProfile(
          avatar: event.avatar,
          name: event.name,
          email: event.email,
        );

        emit(ProfileUpdated(
            message: result.message ?? 'Profile updated successfully'));
      } catch (e) {
        emit(ProfileError(message: 'An error occurred: ${e.toString()}'));
      }
    });
  }
}
