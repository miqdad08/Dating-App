import 'package:dating_app/src/theme_manager/asset_image_icon_manager.dart';
import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 34.0,
      width: 143.0,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                  '${AssetImageIconManager.assetPath}/logo_image.png'))),
    );
  }
}
