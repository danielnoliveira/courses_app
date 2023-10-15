import 'dart:math';

import 'package:courses_app/utils/colors_guide.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../../../../resources/resources.dart';

class TopRiskCard extends StatelessWidget {
  final int index;
  const TopRiskCard({super.key, required this.index});

  String getImage() {
    switch (index) {
      case 0:
        return Images.course0;
      case 1:
        return Images.course1;
      case 2:
        return Images.course2;
      case 4:
        return Images.course4;
      case 5:
        return Images.course5;
      default:
        return Images.logo;
    }
  }

  int getStarsQuantity() {
    return index % 2 == 0 ? 4 : 5;
  }

  static double get height =>
      cardHeight +
      space8All +
      titleHeight +
      titleAuthorNameHeight +
      usersRatingHeight +
      moneyHeight;
  static double get cardHeight => cardWidth * 0.44;
  static double get space8All => 32;
  static double get titleHeight => 4.2.w;
  static double get titleAuthorNameHeight => 3.8.w;
  static double get usersRatingHeight => max(24, 4.2.w);
  static double get moneyHeight => 4.2.w;

  static double get cardWidth => 83.w;

  @override
  Widget build(BuildContext context) {
    const space8 = SizedBox(
      height: 8,
    );
    int starts = getStarsQuantity();
    return Container(
      margin: EdgeInsets.only(
        left: 8.5.w,
        right: 8.5.w,
      ),
      width: cardWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.all(15.3),
            width: cardWidth,
            decoration: BoxDecoration(
              color: ColorsGuide.weakGray,
              borderRadius: BorderRadius.circular(8),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                getImage(),
                width: cardWidth,
                height: cardHeight,
                fit: BoxFit.cover,
              ),
            ),
          ),
          space8,
          Text(
            'Junior Scholars Institute' * 2,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.inter(
              fontSize: 4.2.w,
              fontWeight: FontWeight.w600,
              height: 1,
              color: Colors.black,
            ),
          ),
          space8,
          Text(
            'Jos Brown',
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.inter(
              fontSize: 3.8.w,
              fontWeight: FontWeight.w400,
              height: 1,
              color: ColorsGuide.sadGray,
            ),
          ),
          space8,
          Row(
            children: [
              Text(getStarsQuantity().toString(),
                  style: GoogleFonts.inter(
                    fontSize: 4.2.w,
                    fontWeight: FontWeight.w600,
                    height: 1,
                    color: ColorsGuide.yellowGolden,
                  )),
              ...List.generate(
                5,
                (index) {
                  return Icon(
                    Icons.star,
                    color: index < starts
                        ? ColorsGuide.yellowGolden
                        : ColorsGuide.lightGray,
                  );
                },
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                '(1,541)',
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.inter(
                  fontSize: 3.8.w,
                  fontWeight: FontWeight.w500,
                  height: 1,
                  color: ColorsGuide.sadGray,
                ),
              ),
            ],
          ),
          space8,
          Text(
            '\$24',
            style: GoogleFonts.inter(
              fontSize: 4.2.w,
              fontWeight: FontWeight.w600,
              height: 1,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
