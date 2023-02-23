part of 'profile_bloc.dart';

class ProfileInitial extends ProfileState {}

enum ProfileStatus {
  initial,
  standard,
  failure,
}

class ProfileState extends Equatable {
  ProfileState({
    this.user = null,
    this.status = ProfileStatus.initial,
  });

  final User? user;
  final ProfileStatus status;

  @override
  String toString() {
    return '''PostState { status: $status, user: ${user} }''';
  }

  @override
  List<Object> get props => [status];

  ProfileState copyWith(
      {User? user,
      ProfileStatus? status }){
    return ProfileState(
        user: user ?? this.user,
        status: status ?? this.status
    );
  }


}


