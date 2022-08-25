

abstract class LoginStates {}
class LoginInitState extends LoginStates{}
class LoginLoadingState extends LoginStates{}
class LoginsuccessState extends LoginStates{
  final  loginmodel;
  LoginsuccessState(this.loginmodel);
}
class LoginErrorState extends LoginStates{}
class visibiltyChange extends LoginStates{}

class SignUpErrorState extends LoginStates{}
class SignUpLoadingState extends LoginStates{}
class SignUpsuccessState extends LoginStates{
  final SignUpModel ;
  SignUpsuccessState(this.SignUpModel);
  }
  class MediaLoadingState extends LoginStates{}
class MediaSuccessState extends LoginStates{}
class MediaErrorState extends LoginStates{}

