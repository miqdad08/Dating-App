import 'package:dating_app/src/common_widget/banner_widget.dart';
import 'package:dating_app/src/common_widget/custom_button_widget.dart';
import 'package:dating_app/src/common_widget/custom_textfield_widget.dart';
import 'package:dating_app/src/features/authentication/presentation/sign_up_age_job_screen.dart';
import 'package:dating_app/src/theme_manager/values_manager.dart';
import 'package:flutter/material.dart';

import '../../../common_widget/custom_text_button_widget.dart';

class SignUpScreen extends StatefulWidget {
  static const String routeName = '/sign-up';

  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController nameCont = TextEditingController();
  final TextEditingController emailCont = TextEditingController();
  final TextEditingController passwordCont = TextEditingController();

  @override
  void dispose() {
    nameCont.dispose();
    nameCont.clear();
    emailCont.dispose();
    emailCont.clear();
    passwordCont.dispose();
    passwordCont.clear();
    super.dispose();
  }

  String? validationInput() {
    if (nameCont.text.isEmpty ||
        emailCont.text.isEmpty ||
        passwordCont.text.isEmpty) {
      return 'Name, Email or Password can\'t be Empty';
    }

    if (nameCont.text.length < 4 ||
        emailCont.text.length < 4 ||
        passwordCont.text.length < 4) {
      return 'Too Short, minimum 4 characters';
    }

    if (!emailCont.text.contains('@')) {
      return 'Email not valid without @';
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: AppPadding.p24, vertical: AppPadding.p40),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const BannerWidget(),
              CustomTextFieldWidget(
                labelName: 'Complete Name',
                hintText: 'Write your name',
                controller: nameCont,
              ),
              CustomTextFieldWidget(
                labelName: 'Email Address',
                hintText: 'Write your mail address',
                controller: emailCont,
              ),
              CustomTextFieldWidget(
                labelName: 'Password',
                hintText: 'Write your security',
                controller: passwordCont,
                isObscure: true,
              ),
              const SizedBox(
                height: AppSize.s16,
              ),
              CustomButtonWidget(
                title: 'Get Started',
                onTap: () {
                  final message = validationInput();
                  if (message != null) {
                    ScaffoldMessenger.of(context).hideCurrentSnackBar();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(message),
                      ),
                    );
                    return;
                  }
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return SignUpAgeJobScreen(
                          fullName: nameCont.text,
                          email: emailCont.text,
                          password: passwordCont.text,
                        );
                      },
                    ),
                  );
                },
              ),
              SizedBox(
                height: AppSize.s20,
              ),
              CustomTextButton(
                title: 'Sign In to My Account',
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
