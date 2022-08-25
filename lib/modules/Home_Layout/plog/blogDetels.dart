import 'package:flutter/material.dart';

import '../../../shared/styles/colors.dart';
class BlogDetals extends StatelessWidget {
  final item;
   BlogDetals( {Key? key,this.item,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          item.imageUrl == null

              ? Image.asset(

            'assets/images/plant.png',
            width:double.infinity,fit: BoxFit.cover,

            color: Colors.black12,

          )

              : Image.network(

            "https://lavie.orangedigitalcenteregypt.com${item.imageUrl}",width:double.infinity,fit: BoxFit.cover,
            height: MediaQuery.of(context).size.height/2,




            errorBuilder:

                (BuildContext context, Object exception, StackTrace? stackTrace) {



              return  Image.asset(

                'assets/images/plant.png',

                width:double.infinity,
                height: MediaQuery.of(context).size.height/4,
                fit: BoxFit.cover,

                color: Colors.black12,

              );

            },

            loadingBuilder: (BuildContext context, Widget child,

                ImageChunkEvent? loadingProgress) {

              if (loadingProgress == null) {

                return child;

              }

              return Center(

                child: Container(

                  width: 120,

                  height: 120,

                  child: CircularProgressIndicator(

                    value: loadingProgress.expectedTotalBytes != null

                        ? loadingProgress.cumulativeBytesLoaded /

                        loadingProgress.expectedTotalBytes!

                        : null,

                  ),

                ),

              );

            },

          ),
          Container(
            margin: EdgeInsets.only(top: MediaQuery.of(context).size.height/3),
            padding: EdgeInsets.all(8.0),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(18),topRight:  Radius.circular(14)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
             // mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                 
                Text("${item.name}",
                  style: TextStyle(
                      color: DefeultColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 22),
                ),
                SizedBox(height: 8,),
                Text(
                  " 5 tips to treat plants",
                  style: TextStyle(color: Colors.black, fontSize: 24,),
                ),
                SizedBox(height: 8,),

                Text(
                  "${item.description}",
                  style: TextStyle(color: Colors.black54, fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
