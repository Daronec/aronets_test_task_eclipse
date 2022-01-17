import 'package:aronets_test_task_eclipse/data/models/user_model.dart';
import 'package:aronets_test_task_eclipse/screens/users_screen/widgets/user_item.dart';
import 'package:flutter/material.dart';

class UsersBody extends StatelessWidget {
  const UsersBody({
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
            return UserItem(
              user: userList![index],
            );
          },
        )
        : const Center(
            child: Text('Друзей нет =('),
          );
  }
}
