part of 'post_bloc.dart';

@immutable
abstract class PostState extends Equatable {
  const PostState();

  @override
  List<Object?> get props => [];
}

class InitialPostState extends PostState {}

class LoadingPostState extends PostState {}

class ErrorPostState extends PostState {
  const ErrorPostState({
    required this.error,
  });

  final String error;

  @override
  List<Object?> get props => [error];
}

class SuccessPostState extends PostState {
  const SuccessPostState({
    required this.message,
  });

  final String message;

  @override
  List<Object?> get props => [message];
}

class DataPostState extends PostState {
  const DataPostState({
    required this.post,
  });

  final PostModel post;

  @override
  List<Object?> get props => [post];
}
