import 'package:aronets_test_task_eclipse/data/models/comment_model.dart';
import 'package:aronets_test_task_eclipse/screens/posts_screen/details_post_screen/bloc/post_bloc.dart';
import 'package:aronets_test_task_eclipse/screens/posts_screen/details_post_screen/comment_view_model.dart';
import 'package:aronets_test_task_eclipse/screens/posts_screen/details_post_screen/widgets/add_comment_dialog.dart';
import 'package:aronets_test_task_eclipse/styles/app_colors.dart';
import 'package:aronets_test_task_eclipse/styles/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Comments extends StatelessWidget {
  const Comments({
    Key? key,
    required this.commentList,
  }) : super(key: key);

  final List<CommentModel>? commentList;

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<CommentViewModel>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Комментарии',
          style: AppTextStyle.textStyle16w500,
        ),
        const SizedBox(
          height: 10,
        ),
        commentList != null
            ? ListView.builder(
                itemCount: commentList!.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        commentList![index].name!,
                        style: AppTextStyle.textStyle16w500,
                      ),
                      Text(commentList![index].email!),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const [
                            BoxShadow(
                              color: AppColors.ultraLightGray,
                              spreadRadius: 2,
                              blurRadius: 2,
                              offset:
                                  Offset(2, 2), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Text(
                          commentList![index].comment!,
                          style: AppTextStyle.textStyle14w300,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  );
                },
              )
            : Container(
                height: 50,
                alignment: Alignment.center,
                child: Text(
                  'Нет комментариев',
                  style: AppTextStyle.textStyle16w500.copyWith(
                    color: AppColors.gray,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () => addCommentDialog(
              context,
              func: () {
                context.read<PostBloc>().add(
                      AddCommentPostEvent(
                        name: vm.nameTextController.text,
                        email: vm.emailTextController.text,
                        comment: vm.commentTextController.text,
                      ),
                    );
              },
            ),
            style: ElevatedButton.styleFrom(
              primary: AppColors.orange,
              padding: const EdgeInsets.all(10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Text(
              'Добавить комментарий',
              style: AppTextStyle.textStyle16w500.copyWith(
                color: AppColors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
