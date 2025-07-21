import 'package:flutter/material.dart';

class CustomTextWidget extends StatelessWidget {
  final String? text;
  final double? size;
  final Color? color;
  final FontWeight? fontWeight;
  final double? height;

  const CustomTextWidget({this.text, this.size, this.color, this.fontWeight, this.height});

  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? '',
      style: TextStyle(
          overflow: TextOverflow.ellipsis,
          color: color ?? Colors.black,
          fontWeight: fontWeight ?? FontWeight.normal,
          fontSize: size ?? 16,
          height: height ?? 1
      ),
      maxLines: 2,
    );
  }
}
