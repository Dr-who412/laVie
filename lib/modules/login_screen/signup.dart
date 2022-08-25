import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../layout/homeLayout.dart';
import '../../shared/componant/componant.dart';
import '../../shared/shared_preference/cachHelper.dart';
import 'cubit/cubit.dart';
import 'cubit/status.dart';
class SignUp extends StatelessWidget {
   SignUp({Key? key}) : super(key: key);
   var emailController=TextEditingController();
   var fristNameController=TextEditingController();
   var lastNameController=TextEditingController();
   var passwordController=TextEditingController();
   var confirmPasswordController=TextEditingController();
   var formKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit,LoginStates>(
        listener: (context,state){
      if (state is SignUpsuccessState) {
        if (state.SignUpModel.type=="Success") {
          print(state.SignUpModel.message);
          showtoast(text: '${state.SignUpModel.message}',state: toastStates.SUCESS);
          CacheHelper.saveData(key:"token", value: state.SignUpModel.data.accessToken).then((value) {
            navigatandFinish(context, HomeLayout());
          });
        } else {
          print("error");
          print(state.SignUpModel.message);
          showtoast(text:'${state.SignUpModel.message}',state: toastStates.ERROR);
        }
      }
    },
    builder: (context,state){
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(left: 20,right: 20),
        child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child:Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Frist Name",style: Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: 14,color: Colors.grey),),
                        DefoultformFild(
                          controller: fristNameController,
                          isPassword: false,
                          type: TextInputType.text,
                          validate: (value) {
                            if (value.isEmpty) {
                              return "Frist Name can't be empty";
                            }
                            return null;
                          },
                        ),
                      ],
                    ),),
                    SizedBox(width: 10,),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Last Name",style: Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: 14,color: Colors.grey),),
                          DefoultformFild(
                            controller: lastNameController,
                            isPassword: false,
                            type: TextInputType.text,
                            validate: (value) {
                              if (value.isEmpty) {
                                return "Last Name can't be empty";
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20.0),
                Text("Email",style: Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: 14,color: Colors.grey),),
                DefoultformFild(
                  controller: emailController,
                  isPassword: false,
                  type: TextInputType.text,
                  validate: (value) {
                    if (value.isEmpty) {
                      return "Email can't be empty";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20.0),
                Text("Password",style: Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: 14,color: Colors.grey),),
                DefoultformFild(
                    controller: confirmPasswordController,
                    type: TextInputType.visiblePassword,
                    isPassword: LoginCubit.get(context).isVisible,
                    suffix: LoginCubit.get(context).passIcon,
                    suffixfun: () {
                      LoginCubit.get(context).visibalPass();
                    },
                    onsubmit: (value) {
                      if (formKey.currentState!.validate()) {
                        LoginCubit.get(context).userLogin(
                            email: emailController.text,
                            password: passwordController.toString());
                      }
                    },
                    validate: (value) {
                      if (value.isEmpty) {
                        return "Password is short";
                      }
                      return null;
                    },
                    label: "Password"),
                Text("Comfirm Password",style: Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: 14,color: Colors.grey),),
                DefoultformFild(
                    controller: passwordController,
                    type: TextInputType.visiblePassword,
                    isPassword: LoginCubit.get(context).isVisible,
                    suffix: LoginCubit.get(context).passIcon,
                    suffixfun: () {
                      LoginCubit.get(context).visibalPass();
                    },
                    onsubmit: (value) {
                      if (formKey.currentState!.validate()) {
                        LoginCubit.get(context).userLogin(
                            email: emailController.toString(),
                            password: passwordController.toString());
                      }
                    },
                    validate: (value) {
                      if (value.isEmpty) {
                        return "Password is Not Same";
                      }
                      return null;
                    },
                    label: "Password"),
                const SizedBox(
                  height: 30.0,
                ),
                ConditionalBuilder(
                  condition: LoginStates is! LoginLoadingState,
                  builder: (BuildContext context) {
                    return defultButton(
                      context: context,
                      onpressed: () {
                        if (formKey.currentState!.validate()) {
                          LoginCubit.get(context). userSignUp(
                            fristName: fristNameController,
                            lastName: lastNameController,
                              email: emailController.text,
                              password: passwordController.text,

                          );
                        }
                      },
                      text: "Sign Up",
                    );
                  },
                  fallback: (BuildContext context) =>
                      Center(child: CircularProgressIndicator(color: Colors.white,)),
                ),
              ],
            )),
      ),
    );
  },
    );
  }
}
