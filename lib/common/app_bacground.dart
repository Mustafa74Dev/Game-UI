import 'package:flutter/material.dart';
import '../styleguide/colors.dart';

class AppBackground extends StatelessWidget {
  Color? firstColor, secondColor, thirdColor;
  AppBackground({
    Key? key,
    required this.firstColor,
    required this.secondColor,
    required this.thirdColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx, constrains) {
        final height = constrains.maxHeight;
        final width = constrains.maxWidth;

        return Stack(
          children: [
            Container(
              color: backgroundColor,
            ),
            Positioned(
              left: -(height / 2 - width / 2),
              bottom: height * 0.18,
              child: Container(
                height: height,
                width: height,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: firstColor,
                ),
              ),
            ),
            Positioned(
              left: width * 0.15,
              top: -width * 0.5,
              child: Container(
                height: width * 1.3,
                width: width * 1.2,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.red,
                ),
              ),
            ),
            Positioned(
              right: -width * 0.2,
              top: -50,
              child: Container(
                height: width * 0.6,
                width: width * 0.6,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: thirdColor,
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
