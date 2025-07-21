import 'package:flutter/material.dart';
import 'package:portofolio/core/constant/color_app.dart';

import 'custom_text_widget.dart';

class MainMobile extends StatelessWidget {
  const MainMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: 400,
      constraints: BoxConstraints(minHeight: 560),
      child: Column(
        children: [
          ShaderMask(
              shaderCallback: (Rect bounds) {
                return LinearGradient(
                    colors: [
                      bgScaffold.withOpacity(0.6),
                      bgScaffold.withOpacity(0.6)
                    ]
                ).createShader(bounds);
              },
              blendMode: BlendMode.srcATop,
              child: Image.asset('assets/amtech2.png', width: size.width/1.3, )
          ),
          SizedBox(height: 20),
          CustomTextWidget(text: "HI,\nI'm Akbar Maulana\nA Flutter Dev", color: Colors.white, size: 24, fontWeight: FontWeight.bold, height: 1.5,),
          SizedBox(height: 20),
          SizedBox(
            width: 250,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: yellowPrimary,
                    padding: EdgeInsets.symmetric(vertical: 20)
                ),
                onPressed: (){},
                child: CustomTextWidget(text: "Get in touch", color: whitePrimary,)
            ),
          )
        ],
      ),
    );
  }
}
