part of 'details_user_bloc.dart';

@immutable
abstract class DetailsUserState extends Equatable {
  const DetailsUserState();

  @override
  List<Object?> get props => [];
}

class InitialDetailsUserState extends DetailsUserState {}

class LoadingDetailsUserState extends DetailsUserState {}

class ErrorDetailsUserState extends DetailsUserState {
  const ErrorDetailsUserState({
    required this.error,
  });

  final String error;

  @override
  List<Object?> get props => [error];
}

class DataDetailsUserState extends DetailsUserState {
  const DataDetailsUserState({
    required this.user,
    required this.posts,
    required this.albums,
  });

  final UserModel user;
  final List<PostModel> posts;
  final List<AlbumsModel> albums;

  @override
  List<Object?> get props => [
        user,
        posts,
        albums,
      ];
}
