import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lavie/modules/Home_Layout/Cubit/homeCubit.dart';
import 'package:lavie/modules/Home_Layout/Cubit/homeState.dart';

import '../../../shared/componant/componant.dart';
import '../../../shared/styles/colors.dart';
class Search extends StatelessWidget {
  Search({Key? key}) : super(key: key);
  var searchController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit,HomeState>(
      listener: (context,state){},
      builder: (context,state){
        return SafeArea(
            top: true,
            bottom: true,
            left: true,
            right: true,
            child: Scaffold(
              body: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: SearchDefult(
                        isClickable: true,
                          context: context,
                          onChange: (value) {
                            print(value);
                            return value;
                          },
                          searchController: searchController),
                    ),
                    SizedBox(height: 6.0,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(width: 12,),
                        Text("Result for ${searchController}"),
                        Text("${0} found"),
                        SizedBox(width: 10,),
                      ],
                    ),

                    SizedBox(height: 10,),
                    
                  ],
                ),
              ),
            )
        );
      },
    );
  }
}
