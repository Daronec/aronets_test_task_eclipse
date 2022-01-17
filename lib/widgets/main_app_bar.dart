import 'package:aronets_test_task_eclipse/styles/app_colors.dart';
import 'package:flutter/material.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MainAppBar({
    Key? key,
    required this.title,
  })  : preferredSize = const Size.fromHeight(kToolbarHeight),
        super(key: key);

  final String title;

  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      centerTitle: true,
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: <Color>[AppColors.red, AppColors.orange]),
        ),
      ),
    );
  }
}
