import 'package:flutter/cupertino.dart';

class CommentViewModel extends ChangeNotifier{
  final nameTextController = TextEditingController(text: '');
  final emailTextController = TextEditingController(text: '');
  final commentTextController = TextEditingController(text: '');

  final nameFocusNode = FocusNode();
  final emailFocusNode = FocusNode();
  final commentFocusNode = FocusNode();

  final nameKey = GlobalKey<FormState>();
  final emailKey = GlobalKey<FormState>();
  final commentKey = GlobalKey<FormState>();


}