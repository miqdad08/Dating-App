import 'package:dating_app/src/app.dart';
import 'package:dating_app/src/features/authentication/presentation/bloc/auth_bloc.dart';
import 'package:dating_app/src/features/likes_you/presentation/bloc/explore_people/explore_people_bloc.dart';
import 'package:dating_app/src/features/likes_you/presentation/bloc/people_loved/people_loved_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc(),
          // Provide State Management from AuthBloc.
        ),
        BlocProvider(
          create: (context) => ExplorePeopleBloc(),
          // Provide State Management from ExplorePeopleBloc.
        ),
        BlocProvider(
          create: (context) => PeopleLovedBloc(),
          // Provide State Management from PeopleLovedBloc.
        ),
      ],
      child: const AppScreen(),
    );
  }
}
