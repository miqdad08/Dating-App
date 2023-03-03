import 'package:dating_app/src/common_widget/logo_widget.dart';
import 'package:dating_app/src/theme_manager/style_manager.dart';
import 'package:flutter/material.dart';

import '../theme_manager/values_manager.dart';

class LogoAndTaglineWidget extends StatelessWidget {
  const LogoAndTaglineWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const LogoWidget(),
        const SizedBox(
          height: AppSize.s6,
        ),
        Text(
          'Find your perfect love.',
          style: getWhiteTextStyle(),
        ),
      ],
    );
  }
}
