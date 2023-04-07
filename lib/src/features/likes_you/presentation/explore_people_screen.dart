import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:dating_app/src/common_widget/explore_people_app_bar_widget.dart';
import 'package:dating_app/src/common_widget/explore_people_button_widget.dart';
import 'package:dating_app/src/common_widget/match_card_widget.dart';
import 'package:dating_app/src/features/authentication/data/data_user_account_local.dart';
import 'package:dating_app/src/features/authentication/domain/user_account.dart';
import 'package:dating_app/src/features/likes_you/presentation/bloc/people_loved/people_loved_bloc.dart';
import 'package:dating_app/src/theme_manager/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/explore_people/explore_people_bloc.dart';

class ExplorePeopleScreen extends StatefulWidget {
  static const routeName = '/explore-people';

  const ExplorePeopleScreen({Key? key}) : super(key: key);

  @override
  State<ExplorePeopleScreen> createState() => _ExplorePeopleScreenState();
}

class _ExplorePeopleScreenState extends State<ExplorePeopleScreen> {
  UserAccount? account;

  final cardController = AppinioSwiperController();

  getDataUserAccount() async {
    final data = await DataUserAccountLocal.getDataUserAccountFromStorage();
    final result = UserAccount.fromMap(data);
    account = result;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    context.read<ExplorePeopleBloc>().add(OnExplorePeopleEventCalled());
    getDataUserAccount();
  }

  @override
  void dispose() {
    cardController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: AppPadding.p24, vertical: AppPadding.p40),
        child: Column(
          children: [
            const Text('Explore People'),
            ExplorePeopleAppBarWidget(
              imagePath: account?.imageProfile,
            ),
            const SizedBox(
              height: AppSize.s50,
            ),
            BlocBuilder<ExplorePeopleBloc, ExplorePeopleState>(
              builder: (context, state) {
                if (state is ExplorePeopleLoading) {
                  return const CircularProgressIndicator();
                }
                if (state is ExplorePeopleLoaded) {
                  final users = state.result;
                  List<Widget> cards = [];
                  for (var user in users) {
                    cards.add(MatchCardWidget(user: user));
                  }
                  return Expanded(
                    child: Column(
                      children: [
                        Expanded(
                          child: AppinioSwiper(
                            padding: EdgeInsets.zero,
                            direction: AppinioSwiperDirection.top,
                            controller: cardController,
                            onSwipe: (
                              int index,
                              AppinioSwiperDirection direction,
                            ) {
                              if (direction == AppinioSwiperDirection.top) {
                                ScaffoldMessenger.of(context)
                                    .hideCurrentSnackBar();
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                        'Yey!, you matched with ${users[index].fullName}'),
                                  ),
                                );
                                if (direction != AppinioSwiperDirection.left &&
                                    direction != AppinioSwiperDirection.right &&
                                    direction !=
                                        AppinioSwiperDirection.bottom) {
                                  context.read<PeopleLovedBloc>().add(
                                        AddPeopleLoved(
                                          user: users[index],
                                        ),
                                      );
                                }
                              }
                            },
                            cards: cards,
                            onEnd: () {
                              context.read<ExplorePeopleBloc>().add(
                                    OnExplorePeopleEventCalled(),
                                  );
                            },
                          ),
                        ),
                        const SizedBox(
                          height: AppSize.s50,
                        ),
                        ExplorePeopleButtonWidget(
                          controller: cardController,
                        ),
                      ],
                    ),
                  );
                }
                return Container();
              },
            ),
          ],
        ),
      ),
    );
  }
}
