import 'package:dating_app/src/common_widget/banner_widget.dart';
import 'package:dating_app/src/common_widget/custom_button_widget.dart';
import 'package:dating_app/src/common_widget/custom_textfield_widget.dart';
import 'package:dating_app/src/features/authentication/domain/user_account.dart';
import 'package:dating_app/src/features/authentication/presentation/sign_up_upload_photo_screen.dart';
import 'package:dating_app/src/theme_manager/values_manager.dart';
import 'package:flutter/material.dart';

class SignUpAgeJobScreen extends StatefulWidget {
  static const String routeName = '/sign-up-age-job';

  final String fullName;
  final String email;
  final String password;

  const SignUpAgeJobScreen(
      {Key? key,
      required this.fullName,
      required this.email,
      required this.password})
      : super(key: key);

  @override
  State<SignUpAgeJobScreen> createState() => _SignUpAgeJobScreenState();
}

class _SignUpAgeJobScreenState extends State<SignUpAgeJobScreen> {
  final TextEditingController jobCont = TextEditingController();
  final TextEditingController ageCont = TextEditingController();

  @override
  void dispose() {
    jobCont.dispose();
    jobCont.clear();
    ageCont.dispose();
    ageCont.clear();
    super.dispose();
  }

  String? validationInput() {
    if (jobCont.text.isEmpty ||
        ageCont.text.isEmpty){
      return 'Occupation or Age can\'t be Empty';
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
                labelName: 'Occupation',
                hintText: 'Write your occupattion',
                controller: jobCont,
              ),
              CustomTextFieldWidget(
                labelName: 'Age',
                hintText: 'Write your age',
                controller: ageCont,
              ),
              const SizedBox(height: 117),
              CustomButtonWidget(
                title: 'Continue Sign Up',
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
                  UserAccount userAccount = UserAccount(
                    fullName: widget.fullName,
                    email: widget.email,
                    password: widget.password,
                    occupation: jobCont.text,
                    age: ageCont.text,
                  );
                  Navigator.pushNamed(
                    context,
                    SignUpUploadPhotoScreen.routeName,
                    arguments: userAccount,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
