import 'package:dating_app/src/features/likes_you/presentation/explore_people_screen.dart';
import 'package:flutter/material.dart';

import '../theme_manager/font_manager.dart';
import '../theme_manager/style_manager.dart';
import '../theme_manager/values_manager.dart';
import 'match_button_widget.dart';

class ProfileDetailImageWidget extends StatelessWidget {
  final String imagePath;

  const ProfileDetailImageWidget({
    super.key,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 420.0,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                imagePath,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: AppPadding.p50,
            horizontal: AppPadding.p26,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MatchButtonWidget(
                iconPath: 'icon_arrow_left.png',
                onTap: () {
                  Navigator.pop(context);
                },
                dimension: 20.0,
              ),
              Text(
                'Lover Profile\nDetail',
                textAlign: TextAlign.center,
                style: getWhiteTextStyle(
                  fontWeight: FontWeightManager.semiBold,
                  fontSize: FontSizeManager.f20,
                ),
              ),
              MatchButtonWidget(
                iconPath: 'icon_close_circle.png',
                onTap: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, ExplorePeopleScreen.routeName, (route) => false);
                },
                dimension: 20.0,
              ),
            ],
          ),
        )
      ],
    );
  }
}
