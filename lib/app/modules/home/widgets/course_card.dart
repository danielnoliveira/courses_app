import 'dart:math';

import 'package:courses_app/utils/colors_guide.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../../../../resources/resources.dart';

@immutable
class CourseCard extends StatelessWidget {
  final int index;
  CourseCard({super.key, required this.index});

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
      cardImageHeight +
      space8All +
      titleHeight +
      titleAuthorNameHeight +
      usersRatingHeight +
      moneyHeight;
  static double get cardImageHeight => 55.w * 0.44;
  static double get space8All => 32;
  static double get titleHeight => 4.2.w;
  static double get titleAuthorNameHeight => 3.8.w;
  static double get usersRatingHeight => max(24, 4.2.w);
  static double get moneyHeight => 4.2.w;

  double get cardWidth => 55.w;

  final GlobalKey _backgroundImageKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    const space8 = SizedBox(
      height: 8,
    );
    int starts = getStarsQuantity();
    return Container(
      padding: const EdgeInsets.only(right: 16),
      width: cardWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: SizedBox(
              width: cardWidth,
              height: cardImageHeight,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Flow(
                      delegate: ParallaxFlowDelegate(
                        scrollable: Scrollable.of(context),
                        backgroundImageKey: _backgroundImageKey,
                        listItemContext: context,
                      ),
                      children: [
                        Image.asset(
                          getImage(),
                          width: cardWidth,
                          height: cardImageHeight,
                          fit: BoxFit.cover,
                          key: _backgroundImageKey,
                        ),
                      ],
                    ),
                  ),
                ],
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

class ParallaxFlowDelegate extends FlowDelegate {
  ParallaxFlowDelegate({
    required this.scrollable,
    required this.listItemContext,
    required this.backgroundImageKey,
  }) : super(repaint: scrollable.position);

  final ScrollableState scrollable;
  final BuildContext listItemContext;
  final GlobalKey backgroundImageKey;

  @override
  BoxConstraints getConstraintsForChild(int i, BoxConstraints constraints) {
    return BoxConstraints.tightFor(
      width: constraints.maxWidth,
    );
  }

  @override
  void paintChildren(FlowPaintingContext context) {
    // Calculate the position of this list item within the viewport.
    final scrollableBox = scrollable.context.findRenderObject() as RenderBox;
    final listItemBox = listItemContext.findRenderObject() as RenderBox;
    final listItemOffset = listItemBox.localToGlobal(
        listItemBox.size.centerLeft(Offset.zero),
        ancestor: scrollableBox);

    // Determine the percent position of this list item within the
    // scrollable area.
    final viewportDimension = scrollable.position.viewportDimension;
    final scrollFraction =
        (listItemOffset.dx / viewportDimension).clamp(0.0, 1.0);

    // Calculate the vertical alignment of the background
    // based on the scroll percent.
    final horizontalAligment = Alignment(scrollFraction * 2 - 1, 0.0);

    // Convert the background alignment into a pixel offset for
    // painting purposes.
    final backgroundSize =
        (backgroundImageKey.currentContext!.findRenderObject() as RenderBox)
            .size;
    final listItemSize = context.size;
    final childRect =
        horizontalAligment.inscribe(backgroundSize, Offset.zero & listItemSize);

    // Paint the background.
    context.paintChild(
      0,
      transform: Transform.translate(offset: Offset(0.0, 0.0)).transform,
    );
  }

  @override
  bool shouldRepaint(covariant ParallaxFlowDelegate oldDelegate) {
    return scrollable != oldDelegate.scrollable ||
        listItemContext != oldDelegate.listItemContext ||
        backgroundImageKey != oldDelegate.backgroundImageKey;
  }
}
