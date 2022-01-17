import 'dart:async';

import 'package:aronets_test_task_eclipse/data/models/photo_model.dart';
import 'package:aronets_test_task_eclipse/data/models/post_model.dart';
import 'package:aronets_test_task_eclipse/data/models/user_model.dart';
import 'package:aronets_test_task_eclipse/repository/repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'details_user_event.dart';

part 'details_user_state.dart';

class DetailsUserBloc extends Bloc<DetailsUserEvent, DetailsUserState> {
  final repository = Repository();

  DetailsUserBloc({
    required this.id,
  }) : super(InitialDetailsUserState());

  final int id;

  UserModel user = UserModel();
  List<PostModel> postList = [];
  List<AlbumsModel> albumsList = [];

  @override
  Stream<DetailsUserState> mapEventToState(DetailsUserEvent event) async* {
    if (event is InitialDetailsUserEvent) {
      yield* _handleInitialDetailsUserEvent(event);
    }
  }

  Stream<DetailsUserState> _handleInitialDetailsUserEvent(
      InitialDetailsUserEvent event) async* {
    yield LoadingDetailsUserState();
    try {
      user = await repository.getUserid(id: id);
      postList = await repository.getPosts();
      albumsList = await repository.getPhotos();
    } on Exception catch (ex) {
      yield ErrorDetailsUserState(error: ex.toString());
    }
    yield DataDetailsUserState(
      user: user,
      posts: postList,
      albums: albumsList,
    );
  }
}
