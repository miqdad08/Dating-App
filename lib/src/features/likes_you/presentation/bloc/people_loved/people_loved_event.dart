part of 'people_loved_bloc.dart';

@immutable
abstract class PeopleLovedEvent {}

class OnPeopleLovedEventCalled extends PeopleLovedEvent{}
class AddPeopleLoved extends PeopleLovedEvent{
  final User user;

  AddPeopleLoved({required this.user});
}
