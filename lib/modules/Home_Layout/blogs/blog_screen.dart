import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lavie/modules/Home_Layout/blogs/singleBlog.dart';


import 'header.dart';

class BlogScreen extends StatefulWidget {
  const BlogScreen({Key? key}) : super(key: key);

  @override
  State<BlogScreen> createState() => _BlogScreenState();
}

class _BlogScreenState extends State<BlogScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            
            Header(label: 'Blog'),
            Container(
              height: 750,
              child: ListView(physics: BouncingScrollPhysics(), children: [
                SingleBlog(
                    description:
                        'leaf, in botany, any usually leaf, in botany, any usually leaf, in botany, any usually leaf, in botany, any usuallyleaf, in botany, any usually leaf, in botany, any usually ',
                    time: '2 days ago',
                    way: '5 Tips to treat plants',
                    productImage: 'assets/Rectangle 15.png'),
                    SingleBlog(
                    description:
                        '''leaf, in botany, any usually leaf, in botany, any usually ''',
                    time: '2 days ago',
                    way: '5 Tips to treat plants' '',
                    productImage: 'assets/Rectangle 15.png'),
                
                SingleBlog(
                    description:
                        '''leaf, in botany, any usually leaf, in botany, any usually ''',
                    time: '2 days ago',
                    way: '5 Tips to treat plants' '',
                    productImage: 'assets/Rectangle 15.png'),
                SingleBlog(
                    description:
                        'leaf, in botany, any usually leaf, in botany, any usually ',
                    time: '2 days ago',
                    way: '5 Tips to treat plants',
                    productImage: 'assets/Rectangle 15.png'),
                SingleBlog(
                    description:
                        'leaf, in botany, any usually leaf, in botany, any usually ',
                    time: '2 days ago',
                    way: '5 Tips to treat plants',
                    productImage: 'assets/Rectangle 15.png'),
                SingleBlog(
                    description:
                        'leaf, in botany, any usually leaf, in botany, any usually ',
                    time: '2 days ago',
                    way: '5 Tips to treat plants',
                    productImage: 'assets/Rectangle 15.png'),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
