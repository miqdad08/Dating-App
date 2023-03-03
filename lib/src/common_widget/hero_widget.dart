import 'package:dating_app/src/theme_manager/asset_image_icon_manager.dart';
import 'package:dating_app/src/theme_manager/values_manager.dart';
import 'package:flutter/material.dart';

class HeroWidget extends StatelessWidget {
  const HeroWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 215,
      margin: const EdgeInsets.symmetric(
          vertical: AppMargin.m30,),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSize.s18),
        image: const DecorationImage(
            image:
                AssetImage('${AssetImageIconManager.assetPath}/hero_image.png'),
            fit: BoxFit.cover),
      ),
    );
  }
}
