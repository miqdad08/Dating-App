import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:dating_app/src/common_widget/match_button_widget.dart';
import 'package:flutter/material.dart';

class ExplorePeopleButtonWidget extends StatelessWidget {
  final AppinioSwiperController controller;
  const ExplorePeopleButtonWidget({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        MatchButtonWidget(
          iconPath: 'icon_close.png',
          onTap: () {
            controller.swipeLeft();
          },
        ),
        MatchButtonWidget(
          iconPath: 'icon_love.png',
          onTap: () {
            controller.swipe();
          },
          dimension: 80,
        ),
        MatchButtonWidget(
          iconPath: 'icon_favorite.png',
          onTap: () {
            controller.swipeRight();
          },
        ),
      ],
    );
  }
}
