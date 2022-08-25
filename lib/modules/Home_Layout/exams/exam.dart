import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'course_exam.dart';

class ExamQuestion2 extends StatefulWidget {
  const ExamQuestion2({Key? key}) : super(key: key);

  @override
  State<ExamQuestion2> createState() => _ExamQuestion2State();
}

class _ExamQuestion2State extends State<ExamQuestion2> {
  @override
  Widget build(BuildContext context) {
    return  CourseQuestion(
        count: 2,
        answer1: 'Highly productive and high performance',
        answer2: 'Develop for iOS and Android from a single codebase',
        onTapBack: (){
              Navigator.pop;
            },
            onTap: (){},
        answer3: 'More testing',
        back: true,
        question: 'Which of these is NOT a pro for Flutter?');
  }
}
