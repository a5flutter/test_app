import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/models/credentials_model.dart';
import 'package:test_app/models/user_model.dart';
import 'package:test_app/services/authentication_service.dart';

part 'authentication_event.dart';

part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(AuthenticationInitial());

  IAuthenticationService service = AuthenticationService();
  UserModel _user;


  @override
  Stream<AuthenticationState> mapEventToState(AuthenticationEvent event) async* {
    if (event is SignIn) {
      print('SignInEvent');
      _user = await service.signIn(event.credentials);
     if (_user != null) {
        yield SignedIn(_user);
     } else
       yield ForgotPassword();
    }
    if (event is SignUp) {
      _user = await service.signUp(event.credentials);
      if (_user != null) {
        yield SignedIn(_user);
      }
    }

    if (event is RestorePassword) {
      if (await service.restorePassword()) {
        yield PasswordResetConfirmed();
      }
    }
  }
}
