import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lavie/modules/login_screen/cubit/status.dart';
import 'package:lavie/shared/shared_preference/cachHelper.dart';
import '../../../layout/homeLayout.dart';
import '../../../models/login_models/loginModel.dart';
import '../../../shared/componant/componant.dart';
import '../../../shared/network/endPoint.dart';
import '../../../shared/network/remote/Dio_Helper.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../login.dart';
import '../../../shared/componant/constance.dart';
import '../signup.dart';
class LoginCubit extends Cubit<LoginStates>{
  LoginCubit():super(LoginInitState());
  static LoginCubit get(context)=>BlocProvider.of(context);
  List <Widget>homeLogin=[
    SignUp(),
    Login(),

  ];
  var CurrentTab=1;
  void changeTabView(index){
    CurrentTab=index;
  }

  late LoginModel loginmodel;
  userLogin({required String email,
    required String password,
  }){
    print("start Login 2");
    emit(LoginLoadingState());
    print("start Login 2");

    DioHelper.poatData(url: LOGIN, data: {
      'email':email,
      'password':password,
    }).then((value){
      print("sucess Login");
      loginmodel =LoginModel.fromJson(value.data);
      print("end Login");
      accessToken= '${loginmodel.data?.accessToken}';
      refreshToken='${loginmodel.data?.refreshToken}';
      userId='${loginmodel.data?.user?.userId}';
      emit(LoginsuccessState(loginmodel));
    }).catchError((error){
      print("error");
      print(error.toString());
      emit(LoginErrorState());
    });
  }
  userSignUp({
    required fristName,
    required lastName,
    required email,
    required password,
  }){
emit(SignUpLoadingState());
DioHelper.poatData(url: SINGUP,data: {
  'firstName':fristName,
  'lastName':lastName,
  'email':email,
  'password':password,
}).then((value) {
  print(value);
  loginmodel=LoginModel.fromJson(value.data);
  accessToken= '${loginmodel.data?.accessToken}';
  refreshToken='${loginmodel.data?.refreshToken}';
  userId='${loginmodel.data?.user?.userId}';
  print("Sign up done");
  emit(SignUpsuccessState(loginmodel));
}).catchError((error){
  emit(SignUpErrorState());
  print("error: $error");});
}
  IconData passIcon=Icons.visibility_outlined;
  bool isVisible=true;
  void visibalPass(){
    isVisible=!isVisible;
    passIcon= isVisible ?Icons.visibility_outlined :Icons.visibility_off_outlined;
    emit(visibiltyChange());
  }
  UserCredential? userMedia;
googleSigin(context){
  emit(MediaLoadingState());
  signInWithGoogle().then((value) {
   print(value);
   userMedia=value;
   CacheHelper.saveData(key: 'token', value: value.credential?.token.toString()
   ).then((value) => navigatandFinish(context, HomeLayout()));
   emit(MediaSuccessState());
 }).catchError((error){
   print("googlr Error : $error ");
   emit(MediaErrorState());
 });
  }
  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }


  //UserCredential? userFacebook;
  facebookSigin(context)async{
    emit(MediaLoadingState());
    await signInWithFacebook().then((value) {
      print(value);
      userMedia=value;
      CacheHelper.saveData(key: 'token', value: value.credential?.token.toString()
      ).then((value) => navigatandFinish(context, HomeLayout()));
      emit(MediaSuccessState());
    }).catchError((error){
      print("googlr Error : $error ");
      emit(MediaErrorState());
    });
  }

  Future<UserCredential> signInWithFacebook() async {
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login();

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken!.token);

    // Once signed in, return the UserCredential
    return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }


// signout(){
//   Firebase.auth.signOut();
//   }
}


