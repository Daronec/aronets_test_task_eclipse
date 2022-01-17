part of 'users_bloc.dart';

@immutable
abstract class UsersEvent {}

class InitialUsersEvent extends UsersEvent {}

class RefreshUsersEvent extends UsersEvent {
  RefreshUsersEvent({
    required this.completer,
  });

  final Completer completer;
}
