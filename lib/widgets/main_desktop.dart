import 'package:flutter/material.dart';
import 'package:portofolio/core/constant/color_app.dart';

import 'custom_text_widget.dart';
class MainDesktop extends StatelessWidget {
  const MainDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return
      //Skill
      Container(
        height: size.height/2,
        constraints: BoxConstraints(minHeight: 750),
        padding: EdgeInsets.symmetric(vertical: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomTextWidget(text: "HI,\nI'm Akbar Maulana\nA Flutter Dev", color: Colors.white, size: 30, fontWeight: FontWeight.bold, height: 1.5,),
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
                ),
              ],
            ),
            // Spacer(),
            Image.asset('assets/amtech2.png', width: size.width/2,),
          ],
        ),
      );
  }
}
