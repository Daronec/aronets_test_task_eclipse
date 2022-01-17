import 'package:aronets_test_task_eclipse/constants/constants.dart';
import 'package:aronets_test_task_eclipse/screens/users_screen/details_user_screen/bloc/details_user_bloc.dart';
import 'package:aronets_test_task_eclipse/screens/users_screen/details_user_screen/widgets/albums_preview.dart';
import 'package:aronets_test_task_eclipse/screens/users_screen/details_user_screen/widgets/post_preview.dart';
import 'package:aronets_test_task_eclipse/screens/users_screen/details_user_screen/widgets/user_info.dart';
import 'package:aronets_test_task_eclipse/screens/users_screen/details_user_screen/widgets/working_info.dart';
import 'package:aronets_test_task_eclipse/styles/app_colors.dart';
import 'package:aronets_test_task_eclipse/widgets/custom_circular_indicator.dart';
import 'package:aronets_test_task_eclipse/widgets/main_app_bar.dart';
import 'package:aronets_test_task_eclipse/widgets/snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailsUserScreen extends StatelessWidget {
  const DetailsUserScreen({
    Key? key,
    required this.id,
  }) : super(key: key);

  final int id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          DetailsUserBloc(id: id)..add(InitialDetailsUserEvent()),
      child: SafeArea(
        top: false,
        child: BlocConsumer<DetailsUserBloc, DetailsUserState>(
          listener: (context, state) {
            if (state is ErrorDetailsUserState) {
              showCustomSnackBar(
                context: context,
                type: TypeSnackBar.error,
                text: state.error,
              );
            }
          },
          builder: (context, state) {
            if (state is LoadingDetailsUserState) {
              return Scaffold(
                  backgroundColor: Colors.white,
                  appBar: AppBar(
                    flexibleSpace: Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight,
                            colors: <Color>[AppColors.red, AppColors.orange]),
                      ),
                    ),
                  ),
                  body: const CustomCircularIndicator());
            }
            if (state is DataDetailsUserState) {
              return Scaffold(
                backgroundColor: Colors.white.withOpacity(0.95),
                appBar: MainAppBar(title: state.user.username!),
                body: SingleChildScrollView(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      UserInfo(user: state.user),
                      const SizedBox(
                        height: 20,
                      ),
                      WorkingInfo(user: state.user),
                      const SizedBox(
                        height: 20,
                      ),
                      PostPreview(
                        postList: state.posts,
                      ),
                      AlbumsPreview(
                        albumList: state.albums,
                      ),
                    ],
                  ),
                ),
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
