import 'package:flutter/material.dart';

import '../styleguide/text_style.dart';

class TextTab extends StatelessWidget {
  String? title;
  bool isSelected;
  VoidCallback? onTabText;
  TextTab({
    Key? key,
    required this.title,
    this.isSelected = false,
    required this.onTabText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -1.58,
      child: InkWell(
        onTap: onTabText,
        child: AnimatedDefaultTextStyle(
          style: isSelected ? selectedTabStyle : defaultTabStyle,
          duration: const Duration(
            milliseconds: 500,
          ),
          child: Text(
            title!,
          ),
        ),
      ),
    );
  }
}
