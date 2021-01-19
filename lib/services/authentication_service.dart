import 'package:test_app/models/credentials_model.dart';
import 'package:test_app/models/user_model.dart';

abstract class IAuthenticationService{
  Future<UserModel> signIn(CredentialsModel credentials);

  Future<UserModel> signUp(CredentialsModel credentials);

  Future<bool> restorePassword();
}

class AuthenticationService extends IAuthenticationService{
  @override
  Future<UserModel> signIn(CredentialsModel credentials) {
    // TODO: implement signIn
    if (credentials.eMail == 'test@gmail.com' && credentials.password == 'password'){
      return Future(() => UserModel());
    }
    // TODO: add push errorDialog here
    return null;
  }

  @override
  Future<UserModel> signUp(CredentialsModel credentials) {
    // TODO: implement signUp
    if (credentials.eMail == 'test@gmail.com' && credentials.password == 'password'){
      return Future(() => UserModel());
    }
    // TODO: add push errorDialog here
    return null;
  }

  @override
  Future<bool> restorePassword() {
    // TODO: implement RestorePassword
    return Future(() => true);
  }

}