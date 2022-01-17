import 'package:aronets_test_task_eclipse/constants/constants.dart';
import 'package:aronets_test_task_eclipse/styles/app_colors.dart';
import 'package:flutter/material.dart';

void showCustomSnackBar({
  required BuildContext context,
  required String text,
  required TypeSnackBar type,
}) {
  Color color = AppColors.lightGray;
  switch (type) {
    case TypeSnackBar.error:
      color = AppColors.red;
      break;
    case TypeSnackBar.success:
      color = AppColors.green;
      break;
    case TypeSnackBar.message:
      color = AppColors.lightGray;
      break;
  }
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
      backgroundColor: color,
      duration: type == TypeSnackBar.error
          ? const Duration(hours: 1)
          : const Duration(seconds: 2),
      action: type == TypeSnackBar.error
          ? SnackBarAction(
              label: 'Закрыть',
              textColor: Colors.white,
              onPressed: () {},
            )
          : null,
    ),
  );
}
