import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../common/text_tab.dart';
import '../common/forum_card.dart';
import '../models/forms_model.dart';

class HorizontalTabLayout extends StatefulWidget {
  const HorizontalTabLayout({Key? key}) : super(key: key);

  @override
  _HorizontalTabLayoutState createState() => _HorizontalTabLayoutState();
}

class _HorizontalTabLayoutState extends State<HorizontalTabLayout>
    with SingleTickerProviderStateMixin {
  int? selectedIndex = 2;

  AnimationController? _contoller;
  // Animation<double>? _animation;
  Animation<Offset>? _animationOffset;
  Animation<double>? _fadeAnimation;

  void _onTabTap(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    _contoller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    _animationOffset = Tween<Offset>(
      begin: const Offset(0, 0),
      end: const Offset(
        -0.05,
        0,
      ),
    ).animate(_contoller!);

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(_contoller!);
  }

  @override
  void dispose() {
    _contoller!.dispose();
    super.dispose();
  }

  playAnimation() {
    _contoller!.reset();
    _contoller!.forward();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 465,
      child: Stack(
        children: [
          Positioned(
            left: -30,
            bottom: 0,
            top: 0,
            width: 110.0,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 80),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextTab(
                    title: 'Media',
                    isSelected: selectedIndex == 0,
                    onTabText: () {
                      _onTabTap(0);
                    },
                  ),
                  TextTab(
                    title: 'Streamers',
                    isSelected: selectedIndex == 1,
                    onTabText: () {
                      _onTabTap(1);
                    },
                  ),
                  TextTab(
                    title: 'Forum',
                    isSelected: selectedIndex == 2,
                    onTabText: () {
                      _onTabTap(2);
                    },
                  ),
                ],
              ),
            ),
          ),
          Padding(
            // ignore: prefer_const_constructors
            padding: EdgeInsets.only(
              left: kIsWeb ? 120.0 : 60.0,
            ),
            child: FutureBuilder(
              future: playAnimation(),
              builder: (ctx, snapshot) {
                return FadeTransition(
                  opacity: _fadeAnimation!,
                  child: SlideTransition(
                    position: _animationOffset!,
                    child: ListView(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      children: getList(selectedIndex!),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }

  List<Widget> getList(int index) {
    return [
      [
        ForumCard(
          forum: fortniteForum,
        ),
        ForumCard(
          forum: pubgForum,
        ),
        ForumCard(
          forum: godOfWar,
        ),
      ],
      [
        ForumCard(
          forum: fortniteForum,
        ),
        ForumCard(
          forum: fortniteForum,
        ),
        ForumCard(
          forum: fortniteForum,
        ),
        ForumCard(
          forum: pubgForum,
        ),
      ],
      [
        ForumCard(
          forum: fortniteForum,
        ),
        ForumCard(
          forum: pubgForum,
        ),
        ForumCard(
          forum: godOfWar,
        ),
      ],
    ][index];
  }
}
