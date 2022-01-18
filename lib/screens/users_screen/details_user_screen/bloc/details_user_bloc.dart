import 'package:aronets_test_task_eclipse/data/models/album_model.dart';
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
  final int id;
  UserModel user = UserModel();
  List<PostModel> postList = [];
  List<AlbumsModel> albumsList = [];

  DetailsUserBloc({
    required this.id,
  }) : super(InitialDetailsUserState()) {
    on<InitialDetailsUserEvent>(_onInitialDetailsUserEvent);
  }

  void _onInitialDetailsUserEvent(
    InitialDetailsUserEvent event,
    Emitter<DetailsUserState> emit,
  ) async {
    emit(LoadingDetailsUserState());
    try {
      user = await repository.getUserid(id: id);
      postList = await repository.getPosts();
      albumsList = await repository.getAlbums();
    } on Exception catch (ex) {
      emit(ErrorDetailsUserState(error: ex.toString()));
    }
    emit(DataDetailsUserState(
      user: user,
      posts: postList,
      albums: albumsList,
    ));
  }
}
