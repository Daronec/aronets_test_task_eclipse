import 'package:aronets_test_task_eclipse/data/models/post_model.dart';
import 'package:aronets_test_task_eclipse/screens/posts_screen/details_post_screen/comment_view_model.dart';
import 'package:aronets_test_task_eclipse/screens/posts_screen/details_post_screen/widgets/comments.dart';
import 'package:aronets_test_task_eclipse/styles/app_text_style.dart';
import 'package:aronets_test_task_eclipse/widgets/big_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailsPostBody extends StatelessWidget {
  const DetailsPostBody({
    Key? key,
    required this.post,
  }) : super(key: key);

  final PostModel post;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CommentViewModel>(
      create: (context) => CommentViewModel(),
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              post.title!,
              style: AppTextStyle.textStyle21w500,
            ),
            const SizedBox(
              height: 10,
            ),
            BigImage(image: post.image!),
            const SizedBox(
              height: 20,
            ),
            Text(
              post.description!,
              style: AppTextStyle.textStyle16w500
                  .copyWith(fontWeight: FontWeight.normal),
            ),
            const Divider(
              thickness: 2,
              height: 30,
            ),
            Comments(
              commentList: post.comments,
            ),
          ],
        ),
      ),
    );
  }
}
