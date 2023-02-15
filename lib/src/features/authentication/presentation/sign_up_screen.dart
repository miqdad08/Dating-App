import 'package:dating_app/src/theme_manager/values_manager.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  static const String routeName = '/sign-up';
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(padding: EdgeInsets.symmetric(horizontal: AppPadding.p24, vertical: AppPadding.p40),),
    );
  }
}
