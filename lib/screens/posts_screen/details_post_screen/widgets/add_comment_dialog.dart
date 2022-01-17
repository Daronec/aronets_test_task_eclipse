import 'package:aronets_test_task_eclipse/constants/constants.dart';
import 'package:aronets_test_task_eclipse/screens/posts_screen/details_post_screen/comment_view_model.dart';
import 'package:aronets_test_task_eclipse/styles/app_colors.dart';
import 'package:aronets_test_task_eclipse/widgets/text_field/main_text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<bool> addCommentDialog(
  BuildContext context, {
  required VoidCallback func,
  VoidCallback? cancelFunc,
}) async {
  return (await showDialog(
        context: context,
        builder: (_) => _Dialog(
          ctx: context,
          func: func,
          cancelFunc: cancelFunc,
        ),
      )) ??
      false;
}

class _Dialog extends StatelessWidget {
  const _Dialog({
    Key? key,
    required this.func,
    required this.ctx,
    this.cancelFunc,
  }) : super(key: key);

  final Function func;
  final Function? cancelFunc;
  final BuildContext ctx;

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<CommentViewModel>(ctx);
    return AlertDialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
      title: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          MainTextField(
            formKey: vm.nameKey,
            textController: vm.nameTextController,
            focusNode: vm.nameFocusNode,
            type: TextFieldType.text,
            hintText: 'Имя',
          ),
          MainTextField(
            formKey: vm.emailKey,
            textController: vm.emailTextController,
            focusNode: vm.emailFocusNode,
            type: TextFieldType.email,
            hintText: 'E-mail',
          ),
          MainTextField(
            formKey: vm.commentKey,
            textController: vm.commentTextController,
            focusNode: vm.commentFocusNode,
            type: TextFieldType.text,
            hintText: 'Ваш комментарий',
            maxLines: 4,
          ),
        ],
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            if (cancelFunc != null) {
              cancelFunc!();
            }
            Navigator.of(ctx).pop();
          },
          child: const Text(
            'Нет',
            style: TextStyle(
              color: AppColors.lightGray,
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            func();
            Navigator.of(ctx).pop();
          },
          child: const Text(
            'Да',
            style: TextStyle(
              color: AppColors.orange,
            ),
          ),
        ),
      ],
    );
  }
}
