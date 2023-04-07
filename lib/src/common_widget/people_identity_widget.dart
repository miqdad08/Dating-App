import 'package:dating_app/src/theme_manager/values_manager.dart';
import 'package:flutter/material.dart';

import '../features/likes_you/domain/user.dart';
import '../theme_manager/font_manager.dart';
import '../theme_manager/style_manager.dart';

class PeopleIdentityWidget extends StatelessWidget {
  final User user;
  const PeopleIdentityWidget({
    super.key, required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppPadding.p24,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            user.fullName,
            style: getWhiteTextStyle(
              fontSize: FontSizeManager.f28,
              fontWeight: FontWeightManager.semiBold,
            ),
          ),
          Text(
            '${user.age}, ${user.occupation}',
            style: getBlackTextStyle(),
          ),
          const SizedBox(
            height: AppSize.s16,
          ),
          Text(
            user.description,
            style: getWhiteTextStyle(),
          ),
          const SizedBox(
            height: AppSize.s16,
          )
        ],
      ),
    );
  }
}
