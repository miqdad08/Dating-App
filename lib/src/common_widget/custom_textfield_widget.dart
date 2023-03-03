import 'package:dating_app/src/theme_manager/color_manager.dart';
import 'package:dating_app/src/theme_manager/style_manager.dart';
import 'package:dating_app/src/theme_manager/values_manager.dart';
import 'package:flutter/material.dart';

class CustomTextFieldWidget extends StatelessWidget {
  final String labelName;
  final String hintText;
  final bool isObscure;
  final TextEditingController controller;

  const CustomTextFieldWidget(
      {Key? key,
      required this.labelName,
      required this.hintText,
      this.isObscure = false,
      required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelName,
          style: getWhiteTextStyle(),
        ),
        const SizedBox(
          height: AppSize.s8,
        ),
        TextField(
          controller: controller,
          obscureText: isObscure,
          style: getWhiteTextStyle(),
          decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(
                  vertical: AppPadding.p15, horizontal: AppPadding.p30),
            filled: true,
            fillColor: ColorManager.secondary,
            hintText: hintText,
            hintStyle: getBlack30TextStyle(),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppSize.s50),
            ),
          ),
        ),
        const SizedBox(height: AppSize.s14,)
      ],
    );
  }
}
