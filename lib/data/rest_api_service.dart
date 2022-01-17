import 'package:aronets_test_task_eclipse/constants/endpoints.dart';
import 'package:aronets_test_task_eclipse/data/dio_client.dart';
import 'package:aronets_test_task_eclipse/data/models/photo_model.dart';
import 'package:aronets_test_task_eclipse/data/models/post_model.dart';
import 'package:aronets_test_task_eclipse/data/models/user_model.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RestApiService {
  final Dio _dio = DioClient().dio;

  Future<List<UserModel>> getUsers() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    final users = _prefs.getString(Endpoints.users);
    if (users == null) {
      final response = await _dio.get<String>(Endpoints.users);
      _prefs.setString(Endpoints.users, response.data!);
      return userListModelFromJson(response.data.toString());
    } else {
      return userListModelFromJson(users);
    }
  }

  Future<List<UserModel>> refreshUsers() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    final response = await _dio.get<String>(Endpoints.users);
    _prefs.setString(Endpoints.users, response.data!);
    return userListModelFromJson(response.data.toString());
  }

  Future<UserModel> getUserId({required int id}) async {
    final response = await _dio.get<String>('${Endpoints.users}/$id');
    return userModelFromJson(response.data.toString());
  }

  Future<List<PostModel>> getPosts() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    final posts = _prefs.getString(Endpoints.posts);
    if (posts == null) {
      final response = await _dio.get<String>(Endpoints.posts);
      _prefs.setString(Endpoints.posts, response.data!);
      return postListModelFromJson(response.data.toString());
    } else {
      return postListModelFromJson(posts);
    }
  }

  Future<PostModel> getPostId({required int id}) async {
    final response = await _dio.get<String>('${Endpoints.posts}/$id');
    return postModelFromJson(response.data.toString());
  }

  Future<List<AlbumsModel>> getPhotos() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    final albums = _prefs.getString(Endpoints.albums);
    if (albums == null) {
      final response = await _dio.get<String>(Endpoints.albums);
      _prefs.setString(Endpoints.albums, response.data!);
      return parsePhotos(response.data.toString());
    } else {
      return parsePhotos(albums);
    }

  }

  Future<String> addComment({
    required String name,
    required String email,
    required String comment,
  }) async {
    final response =
    await _dio.post<String>(Endpoints.comments, data: {
      "name": name,
      "email": email,
      "comment": comment,
    });
    return response.data.toString();
  }
}
