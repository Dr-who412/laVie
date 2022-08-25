import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../layout/homeLayout.dart';
import '../../shared/componant/componant.dart';
import '../../shared/componant/constance.dart';
import '../../shared/shared_preference/cachHelper.dart';
import 'cubit/cubit.dart';
import 'cubit/status.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';

class Login extends StatelessWidget {
   Login({Key? key}) : super(key: key);
  var emailController=TextEditingController();
  var passwordController=TextEditingController();
  var loginFormKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit,LoginStates>(
      listener: (context,state){
        if (state is LoginsuccessState) {
          if (state.loginmodel.type =="Success") {
            print(state.loginmodel.message);
            showtoast(text: '${state.loginmodel.message}',state: toastStates.SUCESS);
            print("${state.loginmodel.data.accessToken}");
            CacheHelper.saveData(key:"accesstoken", value: state.loginmodel.data.accessToken).then((value) {
              accessToken= state.loginmodel.data.accessToken;
              CacheHelper.saveData(key:"refreshToken", value: state.loginmodel.data.refreshToken).then((value) {
                refreshToken= state.loginmodel.data.refreshToken;
                CacheHelper.saveData(key:"userId", value: state.loginmodel.data.user.userId);
                userId="${state.loginmodel.data.user.userId}";
                print("tokens saved");
                navigatandFinish(context, HomeLayout());});

            });
          } else {
            print("error");
            print(state.loginmodel.message);
            showtoast(text:'${state.loginmodel.message}',state: toastStates.ERROR);
          }
        }
      },
      builder: (context,state){
        return Scaffold(
          body: Container(
            padding: EdgeInsets.only(left: 10,right: 20),
            child: Form(
                key: loginFormKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Email",style: Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: 14,color: Colors.grey),),
                    DefoultformFild(
                      controller: emailController,
                      isPassword: false,
                      type: TextInputType.text,
                      validate: (value) {
                        if (value.isEmpty) {
                          return "email can't be empty";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20.0),
                    Text("Password",style: Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: 14,color: Colors.grey),),
                    DefoultformFild(
                        controller: passwordController,
                        type: TextInputType.visiblePassword,
                        isPassword: LoginCubit.get(context).isVisible,
                        suffix: LoginCubit.get(context).passIcon,
                        suffixfun: () {
                          LoginCubit.get(context).visibalPass();
                        },
                        onsubmit: (value) {
                          if (loginFormKey.currentState!.validate()) {
                            // LoginCubit.get(context).userLogin(
                            //     email: emailController.text,
                            //     password: passwordController.text);
                          }
                        },
                        validate: (value) {
                          if (value.isEmpty) {
                            return "Password is short";
                          }
                          return null;
                        },
                        label: "Password"),
                    const SizedBox(
                      height: 20.0,
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    ConditionalBuilder(
                      condition: LoginStates is! LoginLoadingState,
                      builder: (BuildContext context) {
                        return defultButton(
                          context: context,
                          onpressed: () {
                            if (loginFormKey.currentState!.validate()) {
                              print("start Login");
                              LoginCubit.get(context).userLogin(
                                  email: emailController.text,
                                  password: passwordController.text);
                            }
                          },
                          text: "LOGIN",
                        );
                      },
                      fallback: (BuildContext context) =>
                          Center(child: CircularProgressIndicator()),
                    ),
                    //SizedBox(height: 29.0,),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     Expanded(
                    //       child:Container(
                    //       //width: 212,
                    //       height: 1,
                    //       decoration: BoxDecoration(
                    //         borderRadius: BorderRadius.circular(30),
                    //         color: Colors.grey,
                    //       ),
                    //     ),
                    //     ),
                    //     Text("or continue with",style: Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: 12,color: Colors.grey)),
                    //     Expanded(
                    //       child: Container(
                    //         //width: 212,
                    //         height: 1,
                    //         decoration: BoxDecoration(
                    //           borderRadius: BorderRadius.circular(30),
                    //           color: Colors.grey,
                    //         ),
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    // SizedBox(height: 22.5,),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [
                    //     Expanded(child:InkWell(
                    //       onTap: (){},
                    //       child: Image.asset('assets/images/google.png',),
                    //     ),
                    //     ),
                    //     SizedBox(width: 7.14,),
                    //     Expanded(
                    //       child: InkWell(
                    //         onTap: (){},
                    //         child: Image.asset('assets/images/facebook.png',
                    //         ),
                    //       ),
                    //     ),
                    //   ],)

                  ],
                )),
          ),
        );
      },
    );
  }
}
