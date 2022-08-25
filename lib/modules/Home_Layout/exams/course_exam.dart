import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:hexcolor/hexcolor.dart';

class CourseQuestion extends StatefulWidget {
  int count;
  String question;
  String answer1;
  String answer2;
  String answer3;
  bool back;
  Function onTap;
  Function onTapBack;

  CourseQuestion({
    required this.count,
    required this.answer1,
    required this.answer2,
    required this.answer3,
    required this.back,
    required this.question,
    required this.onTap,
    required this.onTapBack,
  });

  @override
  State<CourseQuestion> createState() => _CourseQuestionState();
}

enum AddressTypes {
  // ignore: constant_identifier_names
  Answer1,
  // ignore: constant_identifier_names
  Answer2,
  // ignore: constant_identifier_names
  Answer3,
}

class _CourseQuestionState extends State<CourseQuestion> {
  var myType = AddressTypes.Answer1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: Center(
                child: Text(
                  'Course Exam',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _QestionNumber(count: 1),
                  _Qestion(question: 'What is the user experience?'),
                  _Answer1(
                      answer1:
                          'The user experience is how the developer feels about a user.'),
                  _Answer2(
                      answer2:
                          'The user experience is how the user feels about interacting with or experiencing aproduct.'),
                  _Answer3(
                      answer3:
                          'The user experience is the attitude the UX designer has about a product.'),
                  SizedBox(
                    height: 50,
                  ),
                  _footer(back: true, onTap: () {}, onTap2: () {})
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _QestionNumber({required int count}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 40),
      child: Row(
        children: [
          Text(
            'Question',
            style: TextStyle(fontSize: 35, color: Colors.black),
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            widget.count.toString(),
            style: TextStyle(
              fontSize: 35,
              color: HexColor('#1ABC00'),
            ),
          ),
          Text(
            '/10',
            style: TextStyle(fontSize: 12, color: Colors.grey),
          )
        ],
      ),
    );
  }

  Widget _Qestion({required String question}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 40),
      child: Row(
        children: [
          Expanded(
            child: Text(
              widget.question.toString(),
              style: TextStyle(fontSize: 20, color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }

  Widget _Answer1({required String answer1}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 35),
      child: Container(
        padding: const EdgeInsets.all(5),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: HexColor('#1ABC00'),
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  widget.answer1.toString(),
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              ),
            ),
            // RadioListTile(
            //   value: AddressTypes.Answer1,
            //   groupValue: myType,
            //   title: Text('Work'),
            //   onChanged: (AddressTypes? value) {
            //     setState(() {
            //       myType = value!;
            //     });
            //   },
            //   secondary: Icon(
            //     Icons.work,
            //     color: Color.fromARGB(255, 237, 204, 71),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  Widget _Answer2({required String answer2}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 35),
      child: Container(
        padding: const EdgeInsets.all(5),
        width: double.infinity,
        decoration: BoxDecoration(
         color: Colors.grey[100],
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: HexColor('#1ABC00'),
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  widget.answer2.toString(),
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              ),
            ),
            // RadioListTile(
            //   value: AddressTypes.Answer1,
            //   groupValue: myType,
            //   title: Text('Work'),
            //   onChanged: (AddressTypes? value) {
            //     setState(() {
            //       myType = value!;
            //     });
            //   },
            //   secondary: Icon(
            //     Icons.work,
            //     color: Color.fromARGB(255, 237, 204, 71),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  Widget _Answer3({required String answer3}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: Container(
        padding: const EdgeInsets.all(5),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: HexColor('#1ABC00'),
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  widget.answer3.toString(),
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              ),
            ),
            // RadioListTile(
            //   value: AddressTypes.Answer1,
            //   groupValue: myType,
            //   title: Text('Work'),
            //   onChanged: (AddressTypes? value) {
            //     setState(() {
            //       myType = value!;
            //     });
            //   },
            //   secondary: Icon(
            //     Icons.work,
            //     color: Color.fromARGB(255, 237, 204, 71),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  Widget _footer(
      {bool back = false, required Function onTap, required Function onTap2}) {
    return widget.back == false
        ? Container(
            // padding: EdgeInsets.all(10),
            margin: EdgeInsets.only(left: 195),
            height: 45,
            width: 180,
            decoration: BoxDecoration(
              color: HexColor('#1ABC00'),
              borderRadius: BorderRadius.circular(10),
            ),
            child: InkWell(
                onTap: () {
                  setState(() {
                    widget.onTap();
                  });
                },
                child: Center(
                  child: Text(
                    'Next',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                )),
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                // padding: EdgeInsets.all(10),

                height: 45,
                width: 165,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: HexColor('#1ABC00'),
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: InkWell(
                    onTap: () {
                      setState(() {
                        widget.onTap();
                      });
                    },
                    child: Center(
                      child: Text(
                        'Back',
                        style: TextStyle(
                          fontSize: 14,
                          color: HexColor('#1ABC00'),
                        ),
                      ),
                    )),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Container(
                  // padding: EdgeInsets.all(10),

                  height: 45,
                  width: 180,
                  decoration: BoxDecoration(
                    color: HexColor('#1ABC00'),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: InkWell(
                      onTap: () {
                        setState(() {
                          widget.onTapBack();
                        });
                      },
                      child: Center(
                        child: Text(
                          'Next',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                      )),
                ),
              ),
            ],
          );
  }
}
