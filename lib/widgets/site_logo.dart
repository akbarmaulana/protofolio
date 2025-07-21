import 'package:flutter/material.dart';
import 'package:portofolio/core/constant/color_app.dart';

import 'custom_text_widget.dart';

class SiteLogo extends StatelessWidget {
  const SiteLogo({super.key, this.onTap});
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CustomTextWidget(text: 'Amtecht', color: yellowSecondary, size: 22, fontWeight: FontWeight.bold,),
    );
  }
}
