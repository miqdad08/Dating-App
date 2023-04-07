import 'dart:io';

import 'package:dating_app/src/theme_manager/asset_image_icon_manager.dart';
import 'package:dating_app/src/theme_manager/color_manager.dart';
import 'package:flutter/material.dart';

class UploadPhotoWidget extends StatelessWidget {
  UploadPhotoWidget({Key? key, required this.image}) : super(key: key);

  final File? image;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          height: 180.0,
          width: 180.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: ColorManager.secondary,
              width: 8.0,
              // strokeAlign: ,
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: image == null
                ? const Image(
                    image: AssetImage(
                      '${AssetImageIconManager.assetPath}/profile_icon.png',
                    ),
                    fit: BoxFit.cover,
                  )
                : Image(
                    image: FileImage(
                      image!,
                    ),
                    fit: BoxFit.cover,
                  ),
          ),
        ),
        const Positioned(
          bottom: -25.0,
          child: SizedBox(
            width: 50.0,
            height: 50.0,
            child: Image(
              image: AssetImage(
                  '${AssetImageIconManager.assetPath}/icon_add_color.png'),
            ),
          ),
        )
      ],
    );
  }
}
