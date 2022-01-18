import 'package:aronets_test_task_eclipse/data/models/album_model.dart';
import 'package:aronets_test_task_eclipse/data/models/post_model.dart';
import 'package:aronets_test_task_eclipse/data/models/user_model.dart';
import 'package:aronets_test_task_eclipse/data/rest_api_service.dart';
import 'package:hive/hive.dart';

class Repository {
  final restApiService = RestApiService();
  Box<AlbumsModel> albumBox = Hive.box('album_box');
  Box<PostModel> postBox = Hive.box('post_box');
  Box<UserModel> userBox = Hive.box('user_box');

  Future<List<UserModel>> getUsers() async {
    if (userBox.values.isNotEmpty) {
      return userBox.values.toList();
    } else {
      final users = await restApiService.getUsers();
      userBox.addAll(users);
      return users;
    }
  }

  Future<List<UserModel>> refreshUsers() async {
    final users = await restApiService.refreshUsers();
    userBox.putAll(users.asMap());
    return users;
  }

  Future<UserModel> getUserid({required int id}) async {
    if (userBox.values.isNotEmpty) {
      return userBox.values.elementAt(id);
    } else {
      return await restApiService.getUserId(id: id);
    }
  }

  Future<List<PostModel>> getPosts() async {
    if (postBox.values.isNotEmpty) {
      return postBox.values.toList();
    } else {
      final posts = await restApiService.getPosts();
      postBox.addAll(posts);
      return posts;
    }
  }

  Future<PostModel> getPostId({required int id}) async {
    if (postBox.values.isNotEmpty) {
      return postBox.values.elementAt(id);
    } else {
      return await restApiService.getPostId(id: id);
    }
  }

  Future<List<AlbumsModel>> getAlbums() async {
    if (albumBox.values.isNotEmpty) {
      return albumBox.values.toList();
    } else {
      final albums = await restApiService.getAlbums();
      albumBox.addAll(albums);
      return albums;
    }
  }

  Future<String> addComment({
    required String name,
    required String email,
    required String comment,
  }) async {
    return await restApiService.addComment(
      name: name,
      email: email,
      comment: comment,
    );
  }
}
