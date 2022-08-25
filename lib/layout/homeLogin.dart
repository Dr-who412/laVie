import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lavie/modules/login_screen/cubit/cubit.dart';
import 'package:lavie/modules/login_screen/cubit/status.dart';
import 'package:lavie/modules/login_screen/signup.dart';
import 'package:lavie/shared/componant/componant.dart';
import 'homeLayout.dart';
import '../shared/shared_preference/cachHelper.dart';
import '../shared/styles/colors.dart';


import '../modules/login_screen/login.dart';
class HomeLogin extends StatefulWidget {

  @override
  State<HomeLogin> createState() => _HomeLoginState();
}

class _HomeLoginState extends State<HomeLogin> with TickerProviderStateMixin{
var emailController=TextEditingController();

var passwordController=TextEditingController();

var formKey=GlobalKey<FormState>();

late TabController _tabController;

@override
void initState() {
  _tabController = TabController(length: 2, vsync: this,initialIndex: 1);
  super.initState();
}

@override
void dispose() {
  super.dispose();
  _tabController.dispose();
}

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<LoginCubit,LoginStates>(
      listener: (context,state){
        if(state is MediaSuccessState){
          showtoast(text: 'media signing success',state: toastStates.SUCESS);
          CacheHelper.saveData(key:"token", value: LoginCubit.get(context).userMedia!.credential!.token.toString()).then((value) {
            navigatandFinish(context, HomeLayout());
          });
          navigatandFinish(context, HomeLayout());
        }
      },
      builder: (context,state){

        var Cubit=LoginCubit.get(context);

        return Scaffold(
          body:Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset('assets/images/logintop.png'),
                    ],
                  ),
                ),
                Image.asset('assets/images/logo.png'),
                TabBar(
                  controller: _tabController,
                  isScrollable: true,
                  onTap: (index){Cubit.changeTabView(index);},
                  labelColor: DefeultColor,
                  indicatorSize: TabBarIndicatorSize.label,
                  labelStyle: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
                  indicatorColor:  DefeultColor,
                  padding: EdgeInsets.symmetric(horizontal: 24.0),
                  unselectedLabelColor:Colors.grey,
                  tabs: [
                    Tab(text: 'Sign up',),
                    Tab(text: 'Login',),
                  ],),
                SizedBox(height: 10.0,),
                Expanded(
                  flex: 5,
                  child: SingleChildScrollView(
                    physics:BouncingScrollPhysics(),
                    child: Container(
                      width: double.maxFinite,
                      height:550 ,
                      child: TabBarView(
                          controller: _tabController,
                          children: [
                             SignUp(),
                              Login(),
                          ]),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Container(
                        // width: 212,
                        height: 1,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    Text("or continue with",style: Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: 12,color: Colors.grey)),
                    Expanded( child:Container(
                      // width: 212,
                      height: 1,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.grey,
                      ),
                    ),)
                  ],
                ),
                SizedBox(height:2.5,),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(18.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconButton(onPressed: ()async{
                          LoginCubit.get(context).googleSigin(context);
                          navigatandFinish(context, HomeLayout());
                        },iconSize: 24,
                          icon: Image.asset('assets/images/google.png',
                          ),
                        ),
                        IconButton(onPressed: ()async{
                        LoginCubit.get(context).facebookSigin(context);
                        navigatandFinish(context, HomeLayout());
                        },iconSize: 24,
                          icon: Image.asset('assets/images/facebook.png',
                          ),
                        ),
                      ],),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Image.asset('assets/images/loginbottom.png',),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
