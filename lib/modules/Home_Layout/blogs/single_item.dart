import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hexcolor/hexcolor.dart';

class SingleItem extends StatefulWidget {
  String productImage;
  String productName; 
  int productPrice; 
 SingleItem({
required this.productImage,
required this.productName,
required this.productPrice,
  });

  @override
  State<SingleItem> createState() => _SingleItemState();
}

class _SingleItemState extends State<SingleItem> {
  int count = 1;
  @override
  Widget build(BuildContext context) {
    return singleItem();
  }

  Widget singleItem({
     String? productImage,
     String? productName,
    int? productPrice,
  }) {
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
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      widget.productName,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Text(
                    '${widget.productPrice} EGP',
                    style: TextStyle(
                      color: HexColor('#1ABC00'),
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 60,
                        height: 30,
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            InkWell(
                              onTap: () {
                                if (count < 10) {
                                  setState(() {
                                    count++;
                                  });
                                }
                              },
                              child: Icon(
                                Icons.add,
                                size: 12,
                                color: HexColor('#1ABC00'),
                              ),
                            ),
                            Text(
                              "$count",
                              style: TextStyle(fontSize: 10),
                            ),
                            InkWell(
                              onTap: () {
                                if (count > 1) {
                                  setState(() {
                                    count--;
                                  });
                                }
                              },
                              child: Icon(
                                Icons.remove,
                                size: 12,
                                color: HexColor('#1ABC00'),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 100,
                      ),
                      InkWell(
                        onTap: () {},
                        child: Expanded(
                          child: Icon(
                            Icons.delete,
                            size: 30,
                            color: HexColor('#1ABC00'),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }


}
