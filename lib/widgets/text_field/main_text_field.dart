import 'dart:async';

import 'package:aronets_test_task_eclipse/constants/constants.dart';
import 'package:aronets_test_task_eclipse/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

import 'helpers/switch_keyboard_type.dart';
import 'helpers/switch_validation.dart';

class MainTextField extends StatelessWidget {
  MainTextField({
    Key? key,
    required this.textController,
    required this.focusNode,
    required this.type,
    this.hintText = '',
    this.color = Colors.white,
    this.onChange,
    this.onComplete,
    this.formKey,
    this.enableFocus = true,
    this.maxLines = 1,
  }) : super(key: key);

  final TextEditingController textController;
  final FocusNode focusNode;
  final TextFieldType type;
  final String hintText;
  final Color color;
  final Function(String)? onChange;
  final Function()? onComplete;
  final GlobalKey<FormState>? formKey;
  final bool enableFocus;
  final int maxLines;

  final _errorText = BehaviorSubject.seeded('');

  Stream<String> get getErrorText => _errorText.stream;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 10),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          decoration: BoxDecoration(
            color: AppColors.lightGray.withOpacity(0.5),
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextFormField(
            key: formKey!,
            enabled: true,
            maxLines: maxLines,
            controller: textController,
            focusNode: focusNode,
            style: Theme.of(context).textTheme.headline6!.copyWith(
                  color: Colors.black,
                ),
            autofocus: enableFocus,
            keyboardType: switchInputType(type),
            toolbarOptions: const ToolbarOptions(paste: true),
            cursorColor: AppColors.orange,
            validator: (value) {
              final error =
                  switchValidation(context, type, value!);
              _errorText.add(error ?? '');
              return error;
            },
            onChanged: (value) {
              onChange!(textController.text);
            },
            decoration: InputDecoration(
              errorStyle: const TextStyle(
                fontSize: 0,
                height: 0,
              ),
              labelText: hintText,
              labelStyle: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .copyWith(color: AppColors.gray),
              border: InputBorder.none,
              disabledBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              focusedErrorBorder: InputBorder.none,
              contentPadding: const EdgeInsets.all(0),
            ),
          ),
        ),
        StreamBuilder<String>(
          stream: getErrorText,
          initialData: '',
          builder: (context, snapshot) {
            return snapshot.data!.isEmpty
                ? const SizedBox()
                : Padding(
                    padding: const EdgeInsets.only(left: 10, top: 5),
                    child: Text(
                      snapshot.data!,
                      style: const TextStyle(color: AppColors.red),
                    ),
                  );
          },
        ),
      ],
    );
  }
}
