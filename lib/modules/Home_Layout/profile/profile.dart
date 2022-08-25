import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lavie/modules/Home_Layout/Cubit/homeCubit.dart';
import 'package:lavie/modules/Home_Layout/Cubit/homeState.dart';
import 'package:lavie/modules/login_screen/cubit/cubit.dart';
class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

 return  Scaffold(
   body: Stack(
     children: [

      Image.asset( 'assets/images/backgroundProfile.png' ,
        color: Colors.white10,
        // Image.network(

         // '${HomeCubit.get(context).myProfile?.data?.user?.imageUrl}',
         width:double.infinity,fit: BoxFit.cover,
         //height: MediaQuery.of(context).size.height/2,


         // loadingBuilder: (BuildContext context, Widget child,
         //
         //     ImageChunkEvent? loadingProgress) {
         //
         //   if (loadingProgress == null) {
         //
         //     return child;
         //
         //   }
         //
         //   return Center(
         //
         //     child: CircularProgressIndicator(
         //
         //       value: loadingProgress.expectedTotalBytes != null
         //
         //           ? loadingProgress.cumulativeBytesLoaded /
         //
         //           loadingProgress.expectedTotalBytes!
         //
         //           : null,
         //
         //     ),
         //
         //   );
         //
         // },

       ),
       Container(
         height: double.infinity,
         width: double.infinity,
         padding: EdgeInsets.all(18),
         margin: EdgeInsets.only(top: 310),
         decoration: BoxDecoration(
           color: Colors.white,
           borderRadius: BorderRadius.circular(20),
         ),
         child: Column(
           mainAxisAlignment: MainAxisAlignment.start,
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             SizedBox(height: 20,),
                  InkWell(onTap: (){},child: Container(
                    height: 60,
                    margin: EdgeInsets.all(18),
                    color: HexColor('#F3FEF1'),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/images/coin.png'),
                        SizedBox(width: 26,),
                        Text('You have 30 points ')
                      ],
                    ),
                  ),
                  ),
             SizedBox(height: 10,),
             Text("Edit profile",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16),),
             SizedBox(height: 6,),
             InkWell(onTap: (){},
             child: Container(
               height: 60,
               child: Card(
                 shape: RoundedRectangleBorder(
                   borderRadius: BorderRadius.circular(20),
                 ),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.start,
                   children: [
                     SizedBox(width: 10,),
                     Image.asset('assets/images/edit.png'),
                     SizedBox(width: 8,),
                     Text('Change name ',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 14),),
                     Spacer(),
                     Icon(Icons.arrow_forward_ios),
                     SizedBox(width: 10,),
                   ],
                 ),
               ),
             ),),
             SizedBox(height: 6,),
             InkWell(onTap: (){},
               child: Container(
                 height: 60,
                 child: Card(
                   shape: RoundedRectangleBorder(
                     borderRadius: BorderRadius.circular(20),
                   ),
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.start,
                     children: [
                       SizedBox(width: 10,),
                       Image.asset('assets/images/edit.png'),
                       SizedBox(width: 8,),
                       Text('Change Email ',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 14),),
                       Spacer(),
                       Icon(Icons.arrow_forward_ios),
                       SizedBox(width: 10,),
                     ],
                   ),
                 ),
               ),
             ),
           ],
         ),
       ),
       Container(
           margin: EdgeInsets.only(top:70,left:MediaQuery.of(context).size.width/2-100),

           child: Column(
             children: [
               CircleAvatar(radius: 100,backgroundColor: Colors.white10,
               child: Image.asset( 'assets/images/avtProfile.png' ,
               //Image.network(
                 //'${HomeCubit.get(context).myProfile?.data?.user?.imageUrl}',
                 width:double.infinity,fit: BoxFit.cover,
                 //height: MediaQuery.of(context).size.height/2,


                 // loadingBuilder: (BuildContext context, Widget child,
                 //
                 //     ImageChunkEvent? loadingProgress) {
                 //
                 //   if (loadingProgress == null) {
                 //
                 //     return child;
                 //
                 //   }
                 //
                 //   return Center(
                 //
                 //     child: CircularProgressIndicator(
                 //
                 //       value: loadingProgress.expectedTotalBytes != null
                 //
                 //           ? loadingProgress.cumulativeBytesLoaded /
                 //
                 //           loadingProgress.expectedTotalBytes!
                 //
                 //           : null,
                 //
                 //     ),
                 //
                 //   );
                 //
                 // },

               ),),
               SizedBox(height: 2,),
               Text("${HomeCubit.get(context).myProfile?.data?.user?.firstName} "
                   "${HomeCubit.get(context).myProfile?.data?.user?.lastName} ",
                 style: TextStyle(color: Colors.white,fontSize: 24,fontWeight: FontWeight.bold,),)
             ],
           ))
     ],
   ),
 );
      }
 }

