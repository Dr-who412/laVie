import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

// ignore: must_be_immutable
class Header extends StatefulWidget {
  String label;
   // ignore: use_key_in_widget_constructors
   Header({required this.label});

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    return header();
    
  }
  Widget header(
     {
     String? label,
     } 
    ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back),
            color: Colors.black,
          ),
          SizedBox(
            width: 5,
          ),
          Center(
            child: Container(
              margin: EdgeInsets.only(left: 90),
              child: Text(
                widget.label,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ],
      ),
    );
  }
}