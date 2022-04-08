import 'package:flutter/material.dart';
import 'package:game_ui/styleguide/colors.dart';
import 'package:game_ui/styleguide/text_style.dart';
import '../common/app_bacground.dart';
import '../common/horizontal_tab_layout.dart';
import '../styleguide/colors.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          AppBackground(
            firstColor: firstCircleColor,
            secondColor: secondCircleColor,
            thirdColor: thirdCircleColor,
          ),
          // Column(
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   // ignore: prefer_const_literals_to_create_immutables
          //   children: [
          //     const SizedBox(
          //       height: 38.5,
          //     ),
          //     const Padding(
          //       padding: EdgeInsets.only(right: 15.0),
          //       child: Align(
          //         alignment: Alignment.topRight,
          //         child: Material(
          //           elevation: 10,
          //           color: Colors.white,
          //           shape: CircleBorder(),
          //           child: Padding(
          //             padding: EdgeInsets.all(12.0),
          //             child: Icon(
          //               Icons.apps,
          //               color: primaryColor,
          //             ),
          //           ),
          //         ),
          //       ),
          //     ),
          //     const HeadingAndSubHeading(),
          //     const HorizontalTabLayout(),
          //     const Spacer(),
          //     Align(
          //       alignment: Alignment.bottomRight,
          //       child: Container(
          //         padding: const EdgeInsets.symmetric(
          //           horizontal: 60.0,
          //           vertical: 15.0,
          //         ),
          //         decoration: const BoxDecoration(
          //             color: primaryColor,
          //             borderRadius:
          //                 BorderRadius.only(topLeft: Radius.circular(50.0))),
          //         child: const Text(
          //           'New Topic',
          //           style: buttonStyle,
          //         ),
          //       ),
          //     )
          //   ],
          // ),
        ],
      ),
    );
  }
}

class HeadingAndSubHeading extends StatelessWidget {
  const HeadingAndSubHeading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            'Forumn',
            style: headingStyle,
          ),
          Text(
            'Kick off the converstion',
            style: subHeadingStyle,
          ),
        ],
      ),
    );
  }
}
