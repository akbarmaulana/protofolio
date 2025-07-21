import 'package:flutter/material.dart';
import 'package:portofolio/core/constant/color_app.dart';
import 'package:portofolio/core/constant/nav.dart';
import 'package:portofolio/core/styles/style_portofolio.dart';
import 'package:portofolio/widgets/site_logo.dart';

import 'custom_text_widget.dart';

class HeaderPortofolio extends StatelessWidget {
  const HeaderPortofolio({super.key, required this.onNavTap});
  final Function onNavTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.maxFinite,
      margin: EdgeInsets.all(20),
      decoration: kHeaaderStyle,
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          SiteLogo(
            onTap: (){},
          ),
          Spacer(),
          for(int i=0; i<navItems.length; i++)
            Container(
              margin: EdgeInsets.only(right: 25),
              child: TextButton(
                onPressed: ()=>onNavTap(i),
                child: CustomTextWidget(text: navItems[i], color: whitePrimary, size: 16, fontWeight: FontWeight.w600,),
              ),
            )
        ],
      ),
    );
  }
}
