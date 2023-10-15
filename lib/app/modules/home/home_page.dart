import 'dart:math';

import 'package:courses_app/app/modules/home/widgets/course_card.dart';
import 'package:courses_app/app/modules/home/widgets/courses_list.dart';
import 'package:courses_app/app/modules/home/widgets/courses_list_label.dart';
import 'package:courses_app/app/modules/home/widgets/home_bottom_navigation_bar.dart';
import 'package:courses_app/app/modules/home/widgets/top_pick_card.dart';
import 'package:courses_app/commons/default_checkbox.dart';
import 'package:courses_app/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, this.title = 'Home'}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const HomeBottomNavigationBar(),
      body: Container(
        color: Colors.white,
        width: 100.w,
        height: 100.h,
        child: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 0, vertical: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                CoursesListLabel(
                  texts: [
                    TextChild(TextChildType.normal, 'Recommended '),
                    TextChild(TextChildType.bold, 'courses'),
                  ],
                ),
                CoursesList(
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    int value = index % 2 == 0 ? 0 : 2;
                    return CourseCard(index: value);
                  },
                ),
                CoursesListLabel(
                  texts: [
                    TextChild(TextChildType.normal, 'Top '),
                    TextChild(TextChildType.bold, 'trending'),
                  ],
                ),
                CoursesList(
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    int value = index % 2 == 0 ? 4 : 1;
                    return CourseCard(index: value);
                  },
                ),
                CoursesListLabel(
                  texts: [
                    TextChild(TextChildType.normal, 'Our '),
                    TextChild(TextChildType.bold, 'top picks '),
                    TextChild(TextChildType.normal, 'for you'),
                  ],
                ),
                const TopRiskCard(index: 5),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
