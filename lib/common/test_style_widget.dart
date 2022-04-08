import 'package:flutter/material.dart';

class LabelTextWidget extends StatelessWidget {
  String? lable, value;
  TextStyle? labelStyle, valueStyle;
  LabelTextWidget({
    Key? key,
    required this.lable,
    required this.value,
    required this.labelStyle,
    required this.valueStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value!,
          style: valueStyle,
        ),
        Text(
          lable!,
          style: labelStyle,
        )
      ],
    );
  }
}
