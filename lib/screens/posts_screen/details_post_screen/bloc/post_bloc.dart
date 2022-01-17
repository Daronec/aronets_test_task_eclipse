import 'dart:async';

import 'package:aronets_test_task_eclipse/data/models/post_model.dart';
import 'package:aronets_test_task_eclipse/repository/repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final repository = Repository();

  PostBloc({
    required this.id,
  }) : super(InitialPostState());
  final int id;
  PostModel post = PostModel();

  @override
  Stream<PostState> mapEventToState(PostEvent event) async* {
    if (event is InitialPostEvent) {
      yield* _handleInitialDetailsUserEvent(event);
    }
    if (event is AddCommentPostEvent) {
      yield* _handleAddCommentPostEvent(event);
    }
  }

  Stream<PostState> _handleInitialDetailsUserEvent(
      InitialPostEvent event) async* {
    yield LoadingPostState();
    try {
      post = await repository.getPostId(id: id);
    } on Exception catch (ex) {
      yield ErrorPostState(error: ex.toString());
    }
    yield DataPostState(post: post);
  }

  Stream<PostState> _handleAddCommentPostEvent(
      AddCommentPostEvent event) async* {
    yield LoadingPostState();
    try {
      final response = await repository.addComment(
        name: event.name,
        email: event.email,
        comment: event.comment,
      );
      yield SuccessPostState(message: response.toString());
    } on Exception catch (_) {
      yield const ErrorPostState(error: 'Не удалось отправить комментарий');
    }
    yield DataPostState(post: post);
  }
}
