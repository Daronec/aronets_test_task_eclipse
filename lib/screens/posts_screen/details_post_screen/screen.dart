import 'package:aronets_test_task_eclipse/constants/constants.dart';
import 'package:aronets_test_task_eclipse/data/models/comment_model.dart';
import 'package:aronets_test_task_eclipse/data/models/post_model.dart';
import 'package:aronets_test_task_eclipse/screens/posts_screen/details_post_screen/bloc/post_bloc.dart';
import 'package:aronets_test_task_eclipse/screens/posts_screen/details_post_screen/comment_view_model.dart';
import 'package:aronets_test_task_eclipse/screens/posts_screen/details_post_screen/widgets/add_comment_dialog.dart';
import 'package:aronets_test_task_eclipse/styles/app_colors.dart';
import 'package:aronets_test_task_eclipse/styles/app_text_style.dart';
import 'package:aronets_test_task_eclipse/widgets/big_image.dart';
import 'package:aronets_test_task_eclipse/widgets/custom_circular_indicator.dart';
import 'package:aronets_test_task_eclipse/widgets/main_app_bar.dart';
import 'package:aronets_test_task_eclipse/widgets/snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class DetailsPostScreen extends StatelessWidget {
  const DetailsPostScreen({
    Key? key,
    required this.id,
  }) : super(key: key);

  final int id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PostBloc(id: id)..add(InitialPostEvent()),
      child: Scaffold(
        appBar: const MainAppBar(title: 'Пост'),
        body: BlocConsumer<PostBloc, PostState>(
          listener: (context, state) {
            if (state is ErrorPostState) {
              showCustomSnackBar(
                context: context,
                type: TypeSnackBar.error,
                text: state.error,
              );
            }
            if (state is SuccessPostState) {
              showCustomSnackBar(
                context: context,
                type: TypeSnackBar.success,
                text: state.message,
              );
            }
          },
          builder: (context, state) {
            if (state is LoadingPostState) {
              return const CustomCircularIndicator();
            }
            if (state is DataPostState) {
              return _DetailsPostBody(post: state.post);
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}

class _DetailsPostBody extends StatelessWidget {
  const _DetailsPostBody({
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
            _Comments(
              commentList: post.comments,
            ),
          ],
        ),
      ),
    );
  }
}

class _Comments extends StatelessWidget {
  const _Comments({
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
