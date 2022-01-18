import 'package:aronets_test_task_eclipse/constants/endpoints.dart';
import 'package:aronets_test_task_eclipse/data/dio_client.dart';
import 'package:aronets_test_task_eclipse/data/models/album_model.dart';
import 'package:aronets_test_task_eclipse/data/models/post_model.dart';
import 'package:aronets_test_task_eclipse/data/models/user_model.dart';
import 'package:dio/dio.dart';

class RestApiService {
  final Dio _dio = DioClient().dio;

  Future<List<UserModel>> getUsers() async {
    final response = await _dio.get<String>(Endpoints.users);
    return userListModelFromJson(response.data.toString());
  }

  Future<List<UserModel>> refreshUsers() async {
    final response = await _dio.get<String>(Endpoints.users);
    return userListModelFromJson(response.data.toString());
  }

  Future<UserModel> getUserId({required int id}) async {
    final response = await _dio.get<String>('${Endpoints.users}/$id');
    return userModelFromJson(response.data.toString());
  }

  Future<List<PostModel>> getPosts() async {
    final response = await _dio.get<String>(Endpoints.posts);
    return postListModelFromJson(response.data.toString());
  }

  Future<PostModel> getPostId({required int id}) async {
    final response = await _dio.get<String>('${Endpoints.posts}/$id');
    return postModelFromJson(response.data.toString());
  }

  Future<List<AlbumsModel>> getAlbums() async {
    final response = await _dio.get<String>(Endpoints.albums);
    return parsePhotos(response.data.toString());
  }

  Future<String> addComment({
    required String name,
    required String email,
    required String comment,
  }) async {
    final response = await _dio.post<String>(Endpoints.comments, data: {
      "name": name,
      "email": email,
      "comment": comment,
    });
    return response.data.toString();
  }
}
