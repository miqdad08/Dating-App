import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/data_match.dart';
import '../../../domain/user.dart';

part 'people_loved_event.dart';

part 'people_loved_state.dart';

class PeopleLovedBloc extends Bloc<PeopleLovedEvent, PeopleLovedState> {
  PeopleLovedBloc() : super(PeopleLovedInitial()) {
    on<OnPeopleLovedEventCalled>((event, emit) async {
      emit(PeopleLovedLoading());
      await Future.delayed(Duration(seconds: 1));
      emit(PeopleLovedLoaded(userMatch: dataMatchDummy));
    });

    on<AddPeopleLoved>((event, emit)async{
      emit(PeopleLovedLoading());
      dataMatchDummy.add(event.user);
      emit(PeopleLovedLoaded(userMatch: dataMatchDummy));
    });
  }
}
