import 'package:flutter/material.dart';
import '../models/forms_model.dart';
import '../styleguide/text_style.dart';
import '../common/test_style_widget.dart';

// ignore: must_be_immutable
class ForumDetailsWidget extends StatelessWidget {
  Forum forum;
  ForumDetailsWidget({
    Key? key,
    required this.forum,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: MyCustomClipper(),
      child: Container(
        height: 180,
        color: Colors.white,
        padding: const EdgeInsets.only(
          left: 20,
          right: 16,
          top: 24,
          bottom: 12,
        ),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Column(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.grey.withOpacity(0.4),
                        width: 2.0,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        forum.rank!,
                        style: rankStyle,
                      ),
                    ),
                  ),
                  const Text(
                    'New',
                    style: labelTextStyle,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                LabelTextWidget(
                  lable: 'topics',
                  value: forum.topics!.length.toString(),
                  valueStyle: valueTextStyle,
                  labelStyle: labelTextStyle,
                ),
                LabelTextWidget(
                  lable: 'threads',
                  value: forum.threads,
                  valueStyle: valueTextStyle,
                  labelStyle: labelTextStyle,
                ),
                LabelTextWidget(
                  lable: 'subs',
                  value: forum.subs,
                  valueStyle: valueTextStyle,
                  labelStyle: labelTextStyle,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class MyCustomClipper extends CustomClipper<Path> {
  final double distanceFromWall = 12;
  final double controlPointDistanceFromWall = 2;

  @override
  Path getClip(Size size) {
    final double height = size.height;
    final double halfHeight = size.height * 0.5;
    final double width = size.width;
    Path clipPath = Path();

    clipPath.moveTo(
      0,
      halfHeight,
    );
    clipPath.lineTo(
      0,
      height - distanceFromWall,
    );

    clipPath.quadraticBezierTo(
      0 + controlPointDistanceFromWall,
      height - controlPointDistanceFromWall,
      0 + distanceFromWall,
      height,
    );

    clipPath.lineTo(
      width,
      height,
    );

    clipPath.lineTo(
      width,
      0 + 30.0,
    );

    clipPath.quadraticBezierTo(
      width - 5,
      0 + 5.0,
      width - 35,
      0 + 15.0,
    );

    clipPath.close();

    return clipPath;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
