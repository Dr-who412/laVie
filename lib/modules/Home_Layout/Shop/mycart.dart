import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lavie/modules/Home_Layout/Cubit/homeCubit.dart';
import 'package:lavie/modules/Home_Layout/Cubit/homeState.dart';

import '../../../shared/componant/componant.dart';
import '../../../shared/styles/colors.dart';

class MyCart extends StatefulWidget {
  const MyCart({Key? key}) : super(key: key);

  @override
  State<MyCart> createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  @override
  Widget build(BuildContext context) {

    return BlocConsumer<HomeCubit,HomeState>(
      listener: (context,state){},

      builder: (context,state){
        var cubit=HomeCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title:  Text(
            'My Cart',
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
                  condition: (cubit.cartData.isNotEmpty),
                  builder: (BuildContext context) => ListView.builder(
                    physics: BouncingScrollPhysics(),
                      itemCount: cubit.cartData.length,
                      itemBuilder: (context,index)=>CartItem(context,cubit.cartData[index])
                  ),
                  fallback: (BuildContext context) =>Center(child: EmptyScreen(title: "Your cart is empty",subtitle: 'Quick go to shop and add a one'))
                      ),
            
            ));
      },
    );
  }
}
