import 'package:dating_app/src/features/authentication/data/data_user_account_local.dart';
import 'package:dating_app/src/features/authentication/presentation/sign_up_screen.dart';
import 'package:dating_app/src/features/authentication/presentation/sign_up_upload_photo_screen.dart';
import 'package:dating_app/src/features/likes_you/presentation/explore_people_screen.dart';
import 'package:dating_app/src/features/likes_you/presentation/people_loved_screen.dart';
import 'package:dating_app/src/features/likes_you/presentation/people_profile_screen.dart';
import 'package:flutter/material.dart';

import 'theme_manager/theme_data_manager.dart';

class AppScreen extends StatefulWidget {
  const AppScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<AppScreen> createState() => _AppScreenState();
}

class _AppScreenState extends State<AppScreen> {
  bool isRegister = false;

  @override
  void initState() {
    super.initState();
    isUserRegister();
  }

  isUserRegister() async {
    isRegister = await UserAccountRegister.getUserAccountRegister();
    print(isRegister);
    print('qeq');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: getApplicationThemeData(),
      home: isRegister ? ExplorePeopleScreen() : SignUpScreen(),
      // initialRoute: SignUpScreen.routeName,
      routes: {
        SignUpScreen.routeName: (context) => const SignUpScreen(),
        // SignUpAgeJobScreen.routeName: (context) => const SignUpAgeJobScreen(),
        SignUpUploadPhotoScreen.routeName: (context) =>
            const SignUpUploadPhotoScreen(),
        ExplorePeopleScreen.routeName: (context) => const ExplorePeopleScreen(),
        PeopleLovedScreen.routeName: (context) => const PeopleLovedScreen(),
        PeopleProfileScreen.routeName: (context) => const PeopleProfileScreen(),
      },
    );
  }
}
