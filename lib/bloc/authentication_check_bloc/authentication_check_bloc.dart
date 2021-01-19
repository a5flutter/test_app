
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/models/user_model.dart';
import 'package:test_app/services/authentication_check_service.dart';

part 'authentication_check_event.dart';

part 'authentication_check_state.dart';

class AuthenticationCheckBloc extends Bloc<AuthenticationCheckEvent, AuthenticationCheckState> {
  AuthenticationCheckBloc() : super(AuthenticationCheckInitial());

  IAuthenticationCheckService service = AuthenticationCheckService();
  UserModel _user;

  @override
  Stream<AuthenticationCheckState> mapEventToState(AuthenticationCheckEvent event) async* {
    if (event is CheckAuthStatus){
      _user = await service.checkAuthStatus();
      if (_user != null) {
        yield Registered(_user);
      } else {
        yield AuthRequired();
      }
    }
  }
}
