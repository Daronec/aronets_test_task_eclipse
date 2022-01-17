import 'package:aronets_test_task_eclipse/data/models/photo_model.dart';
import 'package:aronets_test_task_eclipse/data/models/post_model.dart';
import 'package:aronets_test_task_eclipse/data/models/user_model.dart';
import 'package:aronets_test_task_eclipse/data/rest_api_service.dart';

class Repository {
  final restApiService = RestApiService();

  Future<List<UserModel>> getUsers() async {
    return await restApiService.getUsers();
  }

  Future<List<UserModel>> refreshUsers() async {
    return await restApiService.refreshUsers();
  }

  Future<UserModel> getUserid({required int id}) async {
    return await restApiService.getUserId(id: id);
  }

  Future<List<PostModel>> getPosts() async {
    return await restApiService.getPosts();
  }

  Future<PostModel> getPostId({required int id}) async {
    return await restApiService.getPostId(id: id);
  }

  Future<List<AlbumsModel>> getPhotos() async {
    return await restApiService.getPhotos();
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
