import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared/componant/componant.dart';
import '../Cubit/homeCubit.dart';
import '../Cubit/homeState.dart';
class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child:SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(18),
                child: Center(child: Text("Notification",style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold,color: Colors.black),)),
              ),
              ListView.builder(
                shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 5,
                  itemBuilder: (context,int index)=> notifiItem()),
            ],
          ),
        ),

      ),
    );

        }

}
