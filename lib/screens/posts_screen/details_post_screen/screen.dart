import 'package:aronets_test_task_eclipse/constants/constants.dart';
import 'package:aronets_test_task_eclipse/screens/posts_screen/details_post_screen/bloc/post_bloc.dart';
import 'package:aronets_test_task_eclipse/screens/posts_screen/details_post_screen/widgets/body.dart';
import 'package:aronets_test_task_eclipse/widgets/custom_circular_indicator.dart';
import 'package:aronets_test_task_eclipse/widgets/main_app_bar.dart';
import 'package:aronets_test_task_eclipse/widgets/snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
              return DetailsPostBody(post: state.post);
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
