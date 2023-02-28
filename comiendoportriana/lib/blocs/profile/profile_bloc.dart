import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:comiendoportriana/models/user.dart';
import 'package:comiendoportriana/services/services.dart';
import 'package:equatable/equatable.dart';
import 'package:comiendoportriana/config/locator.dart';
import 'package:comiendoportriana/services/authentication_service.dart';


part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  late final AuthenticationService _authService;

  ProfileBloc() : super(ProfileInitial()) {
    _authService = getIt<JwtAuthenticationService>();
    on<FetchUserEvent>(_onFetchUserEvent);
  }

  Future<FutureOr<void>> _onFetchUserEvent(
      FetchUserEvent event, Emitter<ProfileState> emit) async {
    emit(ProfileState(status: ProfileStatus.initial));
    try {
      final user = await _authService.getCurrentUser();
      emit(ProfileState(user: user, status: ProfileStatus.standard));
    } catch (_) {
      print(_);
      emit(ProfileState(status: ProfileStatus.failure));
    }
  }

}
