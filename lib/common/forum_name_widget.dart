import 'package:flutter/material.dart';
import '../styleguide/text_style.dart';
import '../styleguide/colors.dart';

class ForumNameWidget extends StatelessWidget {
  String? forumText;
  ForumNameWidget({
    Key? key,
    this.forumText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 20,
      color: primaryColor,
      shape: CustomShapeBorder(),
      child: Padding(
        padding: const EdgeInsets.only(
          top: 18,
          left: 12,
          right: 16,
          bottom: 5,
        ),
        child: Text(
          forumText!,
          style: forumNameTextStyle,
        ),
      ),
    );
  }
}

class CustomShapeBorder extends ShapeBorder {
  final double distanceFromWall = 12;
  final double controlPointDistanceFromWall = 2;
  @override
  EdgeInsetsGeometry get dimensions => throw UnimplementedError();

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    throw UnimplementedError();
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    //return null!;
    return getClip(const Size(130.0, 60.0));
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {}

  @override
  ShapeBorder scale(double t) {
    throw UnimplementedError();
  }

  Path getClip(Size size) {
    Path clipPath = Path();

    clipPath.moveTo(
      0 + distanceFromWall,
      0,
    );

    clipPath.quadraticBezierTo(
      0 + controlPointDistanceFromWall,
      0 + controlPointDistanceFromWall,
      0,
      0 + distanceFromWall,
    );
    clipPath.lineTo(
      0,
      size.height - distanceFromWall,
    );

    clipPath.quadraticBezierTo(
        0 + controlPointDistanceFromWall,
        size.height - controlPointDistanceFromWall,
        0 + distanceFromWall,
        size.height);

    clipPath.lineTo(
      size.width - distanceFromWall,
      size.height,
    );

    clipPath.quadraticBezierTo(
      size.width - controlPointDistanceFromWall,
      size.height - controlPointDistanceFromWall,
      size.width,
      size.height - distanceFromWall,
    );

    clipPath.lineTo(
      size.width,
      size.height * 0.6,
    );

    clipPath.quadraticBezierTo(
      size.width - 1,
      size.height * 0.6 - distanceFromWall,
      size.width - distanceFromWall,
      size.height * 0.6 - distanceFromWall - 3,
    );
    clipPath.lineTo(
      0 + distanceFromWall + 6,
      0,
    );
    clipPath.close();
    return clipPath;
  }
}
