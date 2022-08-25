import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared/componant/componant.dart';
import '../Cubit/homeCubit.dart';
import '../Cubit/homeState.dart';
class Blog extends StatelessWidget {
  const Blog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit,HomeState>(
      listener: (context,state){},

      builder: (context,state){
        var cubit=HomeCubit.get(context);
        return Scaffold(
            appBar: AppBar(
              title:  Text(
                'Blogs',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 30,
                ),
              ),
              centerTitle: true,

            ),
            body: SafeArea(
              top: true,
              left: true,
              right: true,
              child: ConditionalBuilder(
                  condition: (cubit.blogsData?.data!=null),
                  builder: (BuildContext context) => ListView.builder(
                      physics: BouncingScrollPhysics(),
                      itemCount: cubit.blogsData?.data?.plants?.length,
                      itemBuilder: (context,index)=>BlogstItem(context,cubit.blogsData?.data?.plants![index])
                  ),
                  fallback: (BuildContext context) =>Center(child:CircularProgressIndicator(),
                  )
              ),

            ));
      },
    );

  }
}
