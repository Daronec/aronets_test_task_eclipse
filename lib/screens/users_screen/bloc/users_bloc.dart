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
  List<UserModel> userList = [];

  UsersBloc() : super(InitialUsersState()) {
    on<InitialUsersEvent>(_onInitialUsersEvent);
    on<RefreshUsersEvent>(_onRefreshUsersEvent);
  }

  void _onInitialUsersEvent(
    InitialUsersEvent event,
    Emitter<UsersState> emit,
  ) async {
    emit(LoadingUsersState());
    try {
      userList = await repository.getUsers();
    } catch (ex) {
      emit(ErrorUsersState(error: ex.toString()));
    }
    emit(DataUsersState(users: userList));
  }

  void _onRefreshUsersEvent(
    RefreshUsersEvent event,
    Emitter<UsersState> emit,
  ) async {
    try {
      userList = await repository.refreshUsers();
    } catch (ex) {
      emit(ErrorUsersState(error: ex.toString()));
    }
    event.completer.complete();
    emit(DataUsersState(users: userList));
  }
}
