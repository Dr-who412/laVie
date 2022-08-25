// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class BolgDetails extends StatefulWidget {
  String way;
  String description;
  String productImage;
   BolgDetails({Key? key,
  required this.description,
  required this.way,
  required this.productImage});

  @override
  State<BolgDetails> createState() => _BolgDetailsState();
}

class _BolgDetailsState extends State<BolgDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 300,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/Rectangle 15 (1).png'),
                    fit: BoxFit.cover),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20,vertical: 15),
              child: Text(
                '5 Tips to treat plants',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.w500),
              ),
            ),
            Expanded(
              child: Container(
                height: 600,
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: SingleChildScrollView(
                  child: Expanded(
                    child: Text(
                        'leaf, in botany, any usually leaf, in botany, any usually leaf, in botany, any usually leaf, in botany, any usuallyleaf, in botany, any usually leaf, in botany, any usually leaf, in botany, any usually leaf, in botany, any usually leaf, in botany, any usually leaf, in botany, any usuallyleaf, in botany, any usually leaf, in botany, any usually leaf, in botany, any usually leaf, in botany, any usually leaf, in botany, any usually leaf, in botany, any usuallyleaf, in botany, any usually leaf, in botany, any usually leaf, in botany, any usually leaf, in botany, any usually leaf, in botany, any usually leaf, in botany, any usuallyleaf, in botany, any usually leaf, in botany, any usually leaf, in botany, any usually leaf, in botany, any usually leaf, in botany, any usually leaf, in botany, any usuallyleaf, in botany, any usually leaf, in botany, any usually leaf, in botany, any usually leaf, in botany, any usually leaf, in botany, any usually leaf, in botany, any usuallyleaf, in botany, any usually leaf, in botany, any usually leaf, in botany, any usually leaf, in botany, any usually leaf, in botany, any usually leaf, in botany, any usuallyleaf, in botany, any usually leaf, in botany, any usually leaf, in botany, any usually leaf, in botany, any usually leaf, in botany, any usually leaf, in botany, any usuallyleaf, in botany, any usually leaf, in botany, any usually ',
                        style: TextStyle(
                          color: Colors.grey.shade400,
                          fontSize: 16,
                        )),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
