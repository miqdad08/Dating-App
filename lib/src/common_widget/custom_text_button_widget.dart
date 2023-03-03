import 'package:dating_app/src/theme_manager/style_manager.dart';
import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  const CustomTextButton(
      {Key? key, required this.title, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        title,
        style: getBlack30TextStyle()
            .copyWith(decoration: TextDecoration.underline),
      ),
    );
  }
}
