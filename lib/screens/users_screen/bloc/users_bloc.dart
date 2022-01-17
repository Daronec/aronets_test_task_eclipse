import 'dart:async';

import 'package:aronets_test_task_eclipse/data/models/user_model.dart';
import 'package:aronets_test_task_eclipse/repository/repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'users_event.dart';

part 'users_state.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  final repository = Repository();

  UsersBloc() : super(InitialUsersState());

  List<UserModel> userList = [];

  @override
  Stream<UsersState> mapEventToState(UsersEvent event) async* {
    if (event is InitialUsersEvent) {
      yield* _handleInitialUsersEvent(event);
    }
    if (event is RefreshUsersEvent) {
      yield* _handleRefreshUsersEvent(event);
    }
  }

  Stream<UsersState> _handleInitialUsersEvent(InitialUsersEvent event) async* {
    yield LoadingUsersState();
    try {
      userList = await repository.getUsers();
    } catch (ex) {
      yield ErrorUsersState(error: ex.toString());
    }
    yield DataUsersState(users: userList);
  }

  Stream<UsersState> _handleRefreshUsersEvent(RefreshUsersEvent event) async* {
    try {
      userList = await repository.refreshUsers();
    } catch (ex) {
      yield ErrorUsersState(error: ex.toString());
    }
    event.completer.complete();
    yield DataUsersState(users: userList);
  }
}
