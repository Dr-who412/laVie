import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lavie/modules/Home_Layout/Cubit/homeState.dart';
import '../modules/Home_Layout/Cubit/homeCubit.dart';
import '../shared/styles/colors.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit,HomeState>(
        listener:(context,state){} ,
        builder:(context,state){
          var cubit=HomeCubit.get(context);
          Color a=Color.fromARGB(219, 168, 168, 167);
          return Scaffold(
            bottomNavigationBar:  Container(
              padding: EdgeInsets.only(top: 4),
              color: DefeultGrey,
              child: CurvedNavigationBar(
                backgroundColor: DefeultGrey,
                buttonBackgroundColor: DefeultColor,
                color: Colors.white,
                index: cubit.currentBotNavIndex,
                animationCurve: Curves.ease,
                letIndexChange: (index){cubit.ChangeBotNav(index);
                  return true;},
                items: <Widget>[
                    Image.asset('assets/images/leave.png',color: cubit.currentBotNavIndex==0?Colors.white:Colors.black),
                  Image.asset('assets/images/qr.png',color: cubit.currentBotNavIndex==1?Colors.white:Colors.black),
                  Image.asset('assets/images/Home.png',color: cubit.currentBotNavIndex==2?Colors.white:Colors.black),
                  Image.asset('assets/images/Bell.png',color: cubit.currentBotNavIndex==3?Colors.white:Colors.black),
                  Image.asset('assets/images/Profile.png',color: cubit.currentBotNavIndex==4?Colors.white:Colors.black),

                ],
                onTap: (index) {
                  cubit.ChangeBotNav(index);
                  //Handle button tap
                },
              ),
            ),



            body: cubit.homeScreen[cubit.currentBotNavIndex],
          );
        }
    );
  }
}
