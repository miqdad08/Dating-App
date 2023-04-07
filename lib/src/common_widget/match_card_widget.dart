import 'package:dating_app/src/theme_manager/color_manager.dart';
import 'package:dating_app/src/theme_manager/values_manager.dart';
import 'package:flutter/material.dart';

import '../features/likes_you/domain/user.dart';
import 'glass_card_widget.dart';

class MatchCardWidget extends StatelessWidget {
  final User user;

  const MatchCardWidget({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                '${user.imagePath}',
              ),
            ),
            border: Border.all(
              color: ColorManager.secondary,
              width: 10,
            ),
            borderRadius: BorderRadius.circular(AppSize.s70),
          ),
        ),
        GlassCardWidget(
          user: user,
        ),
      ],
    );
  }
}
