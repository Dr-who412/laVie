import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lavie/modules/Home_Layout/Cubit/homeCubit.dart';
import 'package:lavie/modules/Home_Layout/Cubit/homeState.dart';

import '../../../shared/componant/componant.dart';
import '../../../shared/styles/colors.dart';
class Quiz extends StatefulWidget {
   Quiz({Key? key}) : super(key: key);
  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit,HomeState>(
      listener:(context,state){},
      builder:(context,state){
        var change;
        var answer;
        bool isSelected;
        return Scaffold(
          appBar: AppBar(
            title: Text("Course Exam",),
            centerTitle: true,
            backgroundColor: Colors.white,
            elevation: 0.0,
          ),
          body: Container(
            height: double.infinity,
            width: double.infinity,
            padding:EdgeInsets.all(12),
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Row(
                   mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Question ",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
                    SizedBox(width: 6,),
                    Text("${0}/10 ",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: DefeultColor),),
                  ],
                ),
                SizedBox(height: 24,),
                Text("What is the user experience?",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                SizedBox(height: 12,),
                RadioDefault(
                    answerText: 'answer 1',
                  group: answer,
                  onchange: (value){
                      answer=value;
                  },
                 value: 1
                ),
                SizedBox(height: 12,),
                RadioDefault(
                    answerText: 'answer 2',
                    group: answer,
                    onchange: (value){
                      answer=value;
                    },
                    value: 2),
                SizedBox(height: 12,),
                RadioDefault(
                    answerText: 'answer 4',
                    group: answer,
                    onchange: (value){
                      answer=value;
                    },
                    value: 3
                ),
              Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(child: Container(
                      height: 44,
                      decoration: BoxDecoration(
                        color:DefeultGrey,
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(color: DefeultColor,width: 1),
                      ),
                    child: TextButton(onPressed: () {  }, child: Text('Back'),)
                  ),),
                    SizedBox(width: 20,),
                    Expanded(
                      child: Container(
                          height: 44,
                          decoration: BoxDecoration(
                            color:DefeultColor,
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(color: DefeultColor,width: 1),
                          ),
                          child: TextButton(onPressed: () {  }, child: Text('Next..',style: TextStyle(color: Colors.white),),)
                      ),
                    )
                  ],
                ),
                Spacer(),
                  ],
                ),

            ),

        );
      },
    );
  }
}
