import 'package:dating_app/src/common_widget/hero_widget.dart';
import 'package:dating_app/src/common_widget/logo_and_tagline_widget.dart';
import 'package:flutter/material.dart';

class BannerWidget extends StatelessWidget {
  const BannerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        LogoAndTaglineWidget(),
        HeroWidget()
      ],
    );
  }
}
