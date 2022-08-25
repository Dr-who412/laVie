import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hexcolor/hexcolor.dart';

class SingleBlog extends StatefulWidget {
  String time;
  String way;
  String description;
  String productImage;
   // ignore: use_key_in_widget_constructors
   SingleBlog({
    required this.description,
    required this.time,
    required this.way,
    required this.productImage,
  }) ;

  @override
  State<SingleBlog> createState() => _SingleBlogState();
}

class _SingleBlogState extends State<SingleBlog> {
  @override
  Widget build(BuildContext context) {
    return blog(); 
  }
  Widget blog(
  ){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(10),
        height: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        child: Row(
          children: [
            Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    image: AssetImage(widget.productImage), fit: BoxFit.cover),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    
                    Text(
                      '${widget.time} ',
                      style: TextStyle(
                        color: HexColor('#1ABC00'),
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: Text(
                        widget.way,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        widget.description,
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                        )
                      ),
                    ),
            
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}