import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lavie/modules/Home_Layout/profile/createPost.dart';

import '../../../shared/componant/componant.dart';
import '../../../shared/styles/colors.dart';
import '../Cubit/homeCubit.dart';
import '../Cubit/homeState.dart';

class Posts extends StatelessWidget {
  Posts({Key? key}) : super(key: key);
  var searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              navigatTo(context, CreatePost());
            },
            child: Icon(
              Icons.add,
              color: Colors.white,
            ),
            backgroundColor: DefeultColor,
          ),
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.only(top: 12, right: 12, left: 12),
            child: Column(
              children: [
                SizedBox(
                  height: 38,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 12,
                    ),
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.black,
                        )),
                    Spacer(),
                    Text(
                      'Discussion Forums',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
                    ),
                    Spacer(),
                    SizedBox(width: 30)
                  ],
                ),
                SizedBox(
                  height: 10,
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
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.all(14),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.values[0],
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 140,
                        decoration: BoxDecoration(
                            border: Border.all(color: DefeultGrey, width: 2)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      CircleAvatar(),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "mohamed waleed ",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16),
                                          ),
                                          Text(
                                            "1 day",
                                            style: TextStyle(
                                                color: Colors.black38,
                                                fontSize: 12),
                                          ),
                                        ],
                                      ),
                                    ]),
                                SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  "post title here ",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: DefeultColor),
                                ),
                                Expanded(
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 4),
                                    child: Text(
                                      "descriptionsdkgsmjgkjskgknrskngvnerajngrnrbndnbnerkngvkernbasdvlwJIGFWHJJ"
                                      "JFKLwrjvghgw4YEr7389744444444444444444444444444444444444444444444"
                                      "4444444444444444444444444444444444444444444444444445rkndrknbknadkbsksnksk"
                                      "akjfwekdgsbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbvamkka",
                                      style: TextStyle(
                                          fontSize: 14, color: Colors.black38),
                                      maxLines: 2,
                                      softWrap: true,
                                    ),
                                  ),
                                ),
                              ]
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        child: Image.asset(
                          "assets/images/postimage.png",
                          fit: BoxFit.fitWidth,
                        ),
                      ),

                      Row(
                        children: [
                          IconButton(
                              onPressed: () {},iconSize: 18,color: Colors.grey,
                              icon: Image.asset("assets/images/like.png"),),
                          InkWell(child: Text("40 likes",style: TextStyle(color: Colors.grey,),)),
                          SizedBox(width: 20),
                          InkWell(onTap: () {}, child: Text(" 7 Replies",style: TextStyle(color: Colors.grey,),),),
                        ],
                      )

                    ],
                  ),
                ),

                // Expanded(
                //   child: Column(
                //     children: [
                //       Expanded(
                //         child: Container(
                //           height: 120,
                //           decoration:BoxDecoration(
                //             border: Border.all(color: DefeultGrey,)
                //           ),
                //             padding: EdgeInsets.all(16),
                //             child: Column(
                //           children: [
                //             Row(
                //               mainAxisAlignment: MainAxisAlignment.start,
                //               children: [
                //               CircleAvatar(),
                //               SizedBox(width: 8,),
                //               Column(
                //                 children: [
                //                   Text("mohamed waleed ",style: TextStyle(color: DefeultColor,fontWeight: FontWeight.bold,fontSize: 24),),
                //                   Text("1 day",style: TextStyle(color: DefeultGrey,fontSize: 12),),
                //                 ],
                //               ),
                //
                //
                //             ],),
                //             Text("post title",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,),),
                //             Container(padding: EdgeInsets.all(10),
                //               child: Text("descriptionsdkgsmjgkjskgknrskngvnerajngrnrbndnbnerkngvkernbasdvlwJIGFWHJJ"
                //                   "JFKLwrjvghgw4YEr7389744444444444444444444444444444444444444444444"
                //                   "4444444444444444444444444444444444444444444444444445rkndrknbknadkbsksnksk"
                //                   "akjfwekdgsbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbvamkka",
                //                 style: TextStyle(fontSize: 12,color: DefeultGrey),maxLines:6,softWrap: true, ),
                //             )
                //           ],
                //         )
                //         ),
                //       ),
                //      // Expanded(child: Image.asset("assets/images/postimage.png",height:120,width: double.infinity,)),
                //       SizedBox(height: 10,),
                //       // Row(
                //       //   children: [
                //       //     IconButton(onPressed: (){}, icon: Row(children: [Image.asset("assets/images/like.png"),
                //       Text(" 4 likes")],)),
                //       //     InkWell(onTap: (){}, child:Text(" 7 Replies")),
                //       //
                //       //   ],
                //       // )
                //     ],
                //   ),
                // )
              ],
            ),
          ),
        );
      },
    );
    ;
  }
}
