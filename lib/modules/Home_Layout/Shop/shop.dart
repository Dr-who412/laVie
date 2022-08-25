import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lavie/models/product_model/Product.dart';
import 'package:lavie/modules/Home_Layout/Cubit/homeCubit.dart';
import 'package:lavie/modules/Home_Layout/Cubit/homeState.dart';
import 'package:lavie/modules/Home_Layout/Shop/mycart.dart';
import 'package:lavie/modules/Home_Layout/profile/posts.dart';

import '../../../shared/componant/componant.dart';
import '../../../shared/styles/colors.dart';
import '../exams/quiz.dart';
import '../search/search.dart';


class Shop extends StatelessWidget {
  Shop({Key? key}) : super(key: key);
  var searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit,HomeState>(
      listener: (context,state){

      },
      builder: (context,state){
        var cubit=HomeCubit.get(context);
        var length;
        if(cubit.productData?.data?.length==0){
         length=0;
        }else{
          length=cubit.productData?.data?.length;
        }
        return Scaffold(
          body: SafeArea(
            top: true,
            left: true,
            right: true,
            child: Column(
              children: [
                Container(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 12,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(onPressed: (){
                            navigatTo(context, Posts());
                          }, icon: Icon(Icons.post_add_outlined)),
                          Image.asset("assets/images/logo.png"),
                          IconButton(onPressed: (){
                            navigatTo(context, Quiz());
                          }, icon: Icon(Icons.question_mark_outlined)),
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(width: 10,),
                          Expanded(
                            flex: 7,
                            child: Container(
                              height: 50,
                              child: InkWell(
                                onTap: (){navigatTo(context, Search());},
                                child: SearchDefult(
                                    context: context,
                                    isClickable: false,
                                    onChange: (value) {
                                      print(value);
                                      return value;
                                    },
                                    searchController: searchController),
                              ),
                            ),
                          ),
                          SizedBox(width: 10,),
                          Expanded(
                              child: Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                    color: DefeultColor,
                                    borderRadius: BorderRadius.circular(14)),
                                child: IconButton(
                                    onPressed: () {
                                      cubit.getDataFB(context);
                                      navigatTo(context, MyCart());
                                    },
                                    icon: Icon(
                                      Icons.shopping_cart_outlined,
                                      color: Colors.white,
                                    )),
                              )),
                          SizedBox(
                            width: 10,
                          )
                        ],
                      ),
                      SizedBox(height: 10,),
                     Row(
                       mainAxisAlignment: MainAxisAlignment.spaceAround,
                       children: [
                         filterItem(context,title: "all",),
                         filterItem(context,title: "plants",),
                         filterItem(context,title: 'seeds'),
                         filterItem(context,title: 'tools'),
                       ],
                     ),
                      SizedBox(
                        height: 10,
                      ),

                    ],
                  ),
                ),
                Expanded(
                  child: ConditionalBuilder(
                      condition: (cubit.productData?.data !=null),
                      builder: (BuildContext context) {
                        return defeultGridView(length,cubit.productData?.data);
                        },
                      fallback: (BuildContext context) =>
                          Center(child: CircularProgressIndicator(color: DefeultColor,))),
                ),
              ],
            ),
          ),
        );
      },
    )
    ;
  }
}
