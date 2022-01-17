part of 'users_bloc.dart';

abstract class UsersState extends Equatable {
  const UsersState();

  @override
  List<Object?> get props => [];
}

class InitialUsersState extends UsersState {}

class LoadingUsersState extends UsersState {}

class ErrorUsersState extends UsersState {
  const ErrorUsersState({
    required this.error,
  });

  final String error;

  @override
  List<Object?> get props => [error];
}

class DataUsersState extends UsersState {
  const DataUsersState({
    required this.users,
  });

  final List<UserModel> users;

  @override
  List<Object?> get props => [users];
}
