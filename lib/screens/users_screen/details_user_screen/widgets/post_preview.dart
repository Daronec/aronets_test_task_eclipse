import 'package:aronets_test_task_eclipse/data/models/post_model.dart';
import 'package:aronets_test_task_eclipse/screens/posts_screen/details_post_screen/screen.dart';
import 'package:aronets_test_task_eclipse/screens/posts_screen/screen.dart';
import 'package:aronets_test_task_eclipse/styles/app_colors.dart';
import 'package:aronets_test_task_eclipse/styles/app_text_style.dart';
import 'package:flutter/material.dart';

class PostPreview extends StatelessWidget {
  const PostPreview({
    Key? key,
    required this.postList,
  }) : super(key: key);

  final List<PostModel> postList;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Посты',
              style: AppTextStyle.textStyle21w500,
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PostsScreen(
                      postList: postList,
                    ),
                  ),
                );
              },
              child: const Text('Смотреть все'),
              style: TextButton.styleFrom(
                primary: AppColors.red,
                padding: const EdgeInsets.only(right: 20),
              ),
            ),
          ],
        ),
        ListView.builder(
          itemCount: 3,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
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
              child: Container(
                width: MediaQuery.of(context).size.width - 100,
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      postList[index].title!,
                      style: AppTextStyle.textStyle16w500,
                      maxLines: 2,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      postList[index].description!,
                      style: AppTextStyle.textStyle14w300,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
