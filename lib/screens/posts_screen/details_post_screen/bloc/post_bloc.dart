import 'package:aronets_test_task_eclipse/data/models/post_model.dart';
import 'package:aronets_test_task_eclipse/repository/repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final repository = Repository();
  final int id;
  PostModel post = PostModel();

  PostBloc({
    required this.id,
  }) : super(InitialPostState()) {
    on<InitialPostEvent>(_onInitialPostEvent);
    on<AddCommentPostEvent>(_onAddCommentPostEvent);
  }

  void _onInitialPostEvent(
    InitialPostEvent event,
    Emitter<PostState> emit,
  ) async {
    emit(LoadingPostState());
    try {
      post = await repository.getPostId(id: id);
    } on Exception catch (ex) {
      emit(ErrorPostState(error: ex.toString()));
    }
    emit(DataPostState(post: post));
  }

  void _onAddCommentPostEvent(
    AddCommentPostEvent event,
    Emitter<PostState> emit,
  ) async {
    emit(LoadingPostState());
    try {
      final response = await repository.addComment(
        name: event.name,
        email: event.email,
        comment: event.comment,
      );
      emit(SuccessPostState(message: response.toString()));
    } on Exception catch (_) {
      emit(const ErrorPostState(error: 'Не удалось отправить комментарий'));
    }
    emit(DataPostState(post: post));
  }
}
