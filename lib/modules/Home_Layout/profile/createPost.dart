import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lavie/modules/Home_Layout/Cubit/homeCubit.dart';
import 'package:lavie/modules/Home_Layout/Cubit/homeState.dart';

import '../../../shared/componant/componant.dart';
import '../../../shared/styles/colors.dart';

class CreatePost extends StatelessWidget {
  CreatePost({Key? key}) : super(key: key);
  var titleController = TextEditingController();
  var descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (cotext, state) {
        return SafeArea(
            top: true,
            bottom: true,
            right: true,
            left: true,
            child: Scaffold(
              body: SingleChildScrollView(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 25,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 12,
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.arrow_back_ios,
                              color: Colors.black,
                            )),
                        Spacer(),
                        Text(
                          'Create New Post',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 28),
                        ),
                        Spacer(),
                        SizedBox(width: 30)
                      ],
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(
                            color: DefeultColor,
                            width: 1,
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.add,
                              size: 32,
                              color: DefeultColor,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "Add photo",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: DefeultColor),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Title",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    DefoultformFild(
                      controller: titleController,
                      isPassword: false,
                      type: TextInputType.text,
                      validate: (value) {
                        if (value.isEmpty) {
                          return "title is empty !";
                        }
                        return null;
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Description",
                          style: TextStyle(fontSize: 18, color: Colors.grey),
                        ),
                      ],
                    ),
                    Container(

                      child: TextField(
                        controller: descriptionController,
                        keyboardType: TextInputType.text,
                        maxLines: 7,
                        maxLength: 200,
                        decoration: InputDecoration(

                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 18.0,),
                    ConditionalBuilder(
                      condition: true,
                      builder: (BuildContext context) {
                        return defultButton(
                          context: context,
                          onpressed: () {},
                          text: "Post",
                        );
                      },
                      fallback: (BuildContext context) =>
                          Center(child: CircularProgressIndicator()),
                    ),
                  ],
                ),
              ),
            ));
      },
    );
  }
}
