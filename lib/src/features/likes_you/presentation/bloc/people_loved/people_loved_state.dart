part of 'people_loved_bloc.dart';

@immutable
abstract class PeopleLovedState {}

class PeopleLovedInitial extends PeopleLovedState {}

class PeopleLovedLoading extends PeopleLovedState {}

class PeopleLovedLoaded extends PeopleLovedState {
  final List<User> userMatch;

  PeopleLovedLoaded({required this.userMatch});
}
