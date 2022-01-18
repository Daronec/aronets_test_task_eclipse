import 'package:aronets_test_task_eclipse/data/models/album_model.dart';
import 'package:aronets_test_task_eclipse/data/models/comment_model.dart';
import 'package:aronets_test_task_eclipse/data/models/post_model.dart';
import 'package:aronets_test_task_eclipse/data/models/user_model.dart';
import 'package:aronets_test_task_eclipse/data/models/working_model.dart';
import 'package:aronets_test_task_eclipse/screens/users_screen/screen.dart';
import 'package:aronets_test_task_eclipse/simple_bloc_observer.dart';
import 'package:aronets_test_task_eclipse/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(UserModelAdapter());
  Hive.registerAdapter(AlbumsModelAdapter());
  Hive.registerAdapter(PostModelAdapter());
  Hive.registerAdapter(CommentModelAdapter());
  Hive.registerAdapter(WorkingModelAdapter());

  await Hive.openBox<UserModel>('user_box');
  await Hive.openBox<AlbumsModel>('album_box');
  await Hive.openBox<PostModel>('post_box');
  await Hive.openBox<CommentModel>('comment_box');
  await Hive.openBox<WorkingModel>('working_box');
  BlocOverrides.runZoned(
    () {
      runApp(const App());
    },
    blocObserver: SimpleBlocObserver(),
  );
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.dark,
          systemNavigationBarColor: AppColors.orange,
        ),
        child: UsersScreen(),
      ),
    );
  }
}
