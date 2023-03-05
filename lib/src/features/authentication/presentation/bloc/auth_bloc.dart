
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../domain/user_account.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthEvent>((event, emit) {
    });
  }
}
