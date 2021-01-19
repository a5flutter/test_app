import 'package:test_app/models/user_model.dart';

abstract class IAuthenticationCheckService{
  Future<UserModel> checkAuthStatus();
}

class AuthenticationCheckService extends IAuthenticationCheckService{

  @override
  Future<UserModel> checkAuthStatus () {
    // TODO: implement signUp
    //return Future(() => UserModel());
    return null;
  }

}