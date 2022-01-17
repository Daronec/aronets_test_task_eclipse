part of 'post_bloc.dart';

@immutable
abstract class PostEvent {}

class InitialPostEvent extends PostEvent {}

class AddCommentPostEvent extends PostEvent {
  AddCommentPostEvent({
    required this.name,
    required this.email,
    required this.comment,
  });

  final String name;
  final String email;
  final String comment;
}