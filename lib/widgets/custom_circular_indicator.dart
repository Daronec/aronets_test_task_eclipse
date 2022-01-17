import 'package:aronets_test_task_eclipse/styles/app_colors.dart';
import 'package:flutter/material.dart';

class CustomCircularIndicator extends StatelessWidget {
  const CustomCircularIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SizedBox(
        height: 30,
        width: 30,
        child: CircularProgressIndicator(
          strokeWidth: 1,
          backgroundColor: AppColors.lightGray,
          color: AppColors.orange,
        ),
      ),
    );
  }
}
