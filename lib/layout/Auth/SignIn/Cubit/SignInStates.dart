
abstract class LoginStates {}

class InitialStateLoginScreen extends LoginStates {}

class ChangePasswordIconRegister extends LoginStates {}
class LoginLoadingState extends LoginStates {}
class LoginSuccessState extends LoginStates {

  dynamic LoginSuccessModel ;
  LoginSuccessState(this.LoginSuccessModel) ;
}
class LoginErrorState extends LoginStates {
  String? LoginerrorModel ;
  LoginErrorState(this.LoginerrorModel) ;
}




