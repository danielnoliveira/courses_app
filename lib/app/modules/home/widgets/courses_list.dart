import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'course_card.dart';

class CoursesList extends StatelessWidget {
  final int itemCount;
  final Widget? Function(BuildContext, int) itemBuilder;
  const CoursesList(
      {super.key, required this.itemCount, required this.itemBuilder});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: CourseCard.height,
      child: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 8.5.w),
        scrollDirection: Axis.horizontal,
        itemBuilder: itemBuilder,
        itemCount: itemCount,
      ),
    );
  }
}
