import 'dart:async';

import 'package:aronets_test_task_eclipse/constants/constants.dart';
import 'package:aronets_test_task_eclipse/data/models/user_model.dart';
import 'package:aronets_test_task_eclipse/screens/users_screen/bloc/users_bloc.dart';
import 'package:aronets_test_task_eclipse/screens/users_screen/details_user_screen/screen.dart';
import 'package:aronets_test_task_eclipse/styles/app_colors.dart';
import 'package:aronets_test_task_eclipse/styles/app_text_style.dart';
import 'package:aronets_test_task_eclipse/widgets/custom_circular_indicator.dart';
import 'package:aronets_test_task_eclipse/widgets/main_app_bar.dart';
import 'package:aronets_test_task_eclipse/widgets/snack_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => UsersBloc()..add(InitialUsersEvent()),
      child: SafeArea(
        top: false,
        child: Scaffold(
          appBar: const MainAppBar(title: 'Друзья'),
          body: BlocConsumer<UsersBloc, UsersState>(
            listener: (context, state) {
              if (state is LoadingUsersState) {
                const CustomCircularIndicator();
              }
              if (state is ErrorUsersState) {
                showCustomSnackBar(
                  context: context,
                  type: TypeSnackBar.error,
                  text: state.error,
                );
              }
            },
            builder: (context, state) {
              if (state is DataUsersState) {
                return RefreshIndicator(
                  color: AppColors.orange,
                  onRefresh: () {
                    Completer<void> refreshCompleter = Completer();
                    context.read<UsersBloc>().add(
                          RefreshUsersEvent(completer: refreshCompleter),
                        );
                    return refreshCompleter.future;
                  },
                  child: _UsersBody(
                    userList: state.users,
                  ),
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ),
      ),
    );
  }
}

class _UsersBody extends StatelessWidget {
  const _UsersBody({
    Key? key,
    required this.userList,
  }) : super(key: key);

  final List<UserModel>? userList;

  @override
  Widget build(BuildContext context) {
    return userList != null
        ? ListView.builder(
            itemCount: userList!.length,
            shrinkWrap: true,
            padding: const EdgeInsets.all(20),
            itemBuilder: (context, index) {
              return _UserItem(
                user: userList![index],
              );
            },
          )
        : const Center(
            child: Text('Друзей нет =('),
          );
  }
}

class _UserItem extends StatelessWidget {
  const _UserItem({
    Key? key,
    required this.user,
  }) : super(key: key);

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailsUserScreen(
              id: user.id!,
            ),
          ),
        );
      },
      child: Card(
        margin: const EdgeInsets.only(bottom: 16),
        elevation: 6,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: ListTile(
          contentPadding: const EdgeInsets.only(left: 10),
          leading: CachedNetworkImage(
            height: 60,
            width: 60,
            imageUrl: user.photo!,
            imageBuilder: (context, imageProvider) => Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            placeholder: (context, url) => const CustomCircularIndicator(),
            errorWidget: (context, url, error) => const Center(
              child: Icon(Icons.error),
            ),
          ),
          title: Text(
            user.username!,
            style: AppTextStyle.textStyle16w500,
          ),
          subtitle: Text(
            user.name!,
            style: AppTextStyle.textStyle21w500,
          ),
          trailing: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.arrow_forward_ios,
              color: AppColors.orange,
            ),
          ),
        ),
      ),
    );
  }
}
