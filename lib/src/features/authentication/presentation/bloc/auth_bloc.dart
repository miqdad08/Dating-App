import 'package:bloc/bloc.dart';
import 'package:dating_app/src/features/authentication/data/data_user_account_local.dart';
import 'package:meta/meta.dart';

import '../../domain/user_account.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<RegisterAuthEvent>((event, emit) async {
      emit(AuthLoading());
      DataUserAccountLocal.setDataUserAccountToStorage(event.userAccount);
      UserAccountRegister.setUserAccountRegister(event.isRegister);
      await Future.delayed(const Duration(seconds: 2));
      emit(
        AuthSuccess(
          userAccount: event.userAccount,
          isRegister: event.isRegister,
        ),
      );
    });
  }
}
