import 'package:aronets_test_task_eclipse/data/models/user_model.dart';
import 'package:aronets_test_task_eclipse/helpers/functions.dart';
import 'package:aronets_test_task_eclipse/styles/app_colors.dart';
import 'package:aronets_test_task_eclipse/styles/app_text_style.dart';
import 'package:aronets_test_task_eclipse/widgets/custom_circular_indicator.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({
    Key? key,
    required this.user,
  }) : super(key: key);

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 16,
            spreadRadius: 0,
            offset: Offset(4, 4),
          ),
        ],
      ),
      child: Stack(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CachedNetworkImage(
                imageUrl: user.photo!,
                imageBuilder: (context, imageProvider) => Container(
                  height: MediaQuery.of(context).size.width - 40,
                  width: MediaQuery.of(context).size.width - 40,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                placeholder: (context, url) =>
                const CustomCircularIndicator(),
                errorWidget: (context, url, error) => const Center(
                  child: Icon(Icons.error),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(20),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      user.name!,
                      style: AppTextStyle.textStyle21w500,
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Text(
                      user.phone!,
                      style: AppTextStyle.textStyle16w500,
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Text(
                      user.email!,
                      style: AppTextStyle.textStyle16w500,
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Text(
                      user.website!,
                      style: AppTextStyle.textStyle16w500,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            right: 20,
            top: MediaQuery.of(context).size.width - 70,
            child: GestureDetector(
              onTap: () => makePhoneCall(user.phone!),
              child: const CircleAvatar(
                radius: 30,
                backgroundColor: AppColors.green,
                child: Icon(
                  Icons.phone,
                  color: AppColors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
