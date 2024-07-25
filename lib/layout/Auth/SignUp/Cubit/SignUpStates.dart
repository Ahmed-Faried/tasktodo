
abstract class SignUpStates {}

class InitialStateRegisterScreen extends SignUpStates {}

class ChangePasswordIconRegister extends SignUpStates {}
class RegisterLoadingState extends SignUpStates {}
class RegisterSuccessState extends SignUpStates {}
class RegisterErrorState extends SignUpStates {

  final String? error ;

  RegisterErrorState(this.error);
}




