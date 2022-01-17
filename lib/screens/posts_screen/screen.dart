import 'package:aronets_test_task_eclipse/data/models/post_model.dart';
import 'package:aronets_test_task_eclipse/screens/posts_screen/details_post_screen/screen.dart';
import 'package:aronets_test_task_eclipse/widgets/big_image.dart';
import 'package:aronets_test_task_eclipse/widgets/main_app_bar.dart';
import 'package:flutter/material.dart';

class PostsScreen extends StatelessWidget {
  const PostsScreen({
    Key? key,
    required this.postList,
  }) : super(key: key);

  final List<PostModel> postList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppBar(
        title: 'Посты',
      ),
      body: ListView.builder(
        itemCount: postList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailsPostScreen(
                    id: postList[index].id!,
                  ),
                ),
              );
            },
            child: Column(
              children: [
                BigImage(image: postList[index].image!),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 30),
                  child: Text(postList[index].title!),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
