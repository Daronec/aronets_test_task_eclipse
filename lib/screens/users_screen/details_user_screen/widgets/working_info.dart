import 'package:aronets_test_task_eclipse/data/models/user_model.dart';
import 'package:aronets_test_task_eclipse/styles/app_text_style.dart';
import 'package:flutter/material.dart';

class WorkingInfo extends StatelessWidget {
  const WorkingInfo({
    Key? key,
    required this.user,
  }) : super(key: key);

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Работа',
          style: AppTextStyle.textStyle21w500,
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                user.working!.name!,
                style: AppTextStyle.textStyle16w500,
              ),
              const SizedBox(
                height: 6,
              ),
              Text(
                user.working!.businessSegment!,
                style: AppTextStyle.textStyle14w300,
              ),
              const SizedBox(
                height: 6,
              ),
              Text(
                user.working!.catchPhrase!,
                style: AppTextStyle.textStyle16w500.copyWith(
                  fontWeight: FontWeight.normal,
                ),
              ),
              const SizedBox(
                height: 6,
              ),
              Text(
                user.working!.address!,
                style: AppTextStyle.textStyle14w300,
              ),
              const SizedBox(
                height: 6,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
