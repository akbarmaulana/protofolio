import 'package:flutter/material.dart';
import 'package:portofolio/core/constant/color_app.dart';

import 'custom_text_widget.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 50),
      child: Center(
        child: CustomTextWidget(text: "Made by Akbar Maulana with Flutter 3.27.2", color: whitePrimary,),
      ),
    );
  }
}
