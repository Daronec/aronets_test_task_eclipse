import 'dart:async';

import 'package:aronets_test_task_eclipse/constants/constants.dart';
import 'package:aronets_test_task_eclipse/screens/users_screen/bloc/users_bloc.dart';
import 'package:aronets_test_task_eclipse/screens/users_screen/widgets/body.dart';
import 'package:aronets_test_task_eclipse/styles/app_colors.dart';
import 'package:aronets_test_task_eclipse/widgets/custom_circular_indicator.dart';
import 'package:aronets_test_task_eclipse/widgets/main_app_bar.dart';
import 'package:aronets_test_task_eclipse/widgets/snack_bar.dart';
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
                  child: UsersBody(
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
