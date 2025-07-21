import 'package:flutter/material.dart';
import 'package:portofolio/core/constant/color_app.dart';
import 'package:portofolio/core/constant/nav.dart';

import 'custom_text_widget.dart';

class DrawerMobile extends StatelessWidget {
  DrawerMobile({super.key, required this.onNavTap});
  final Function onNavTap;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: bgScaffold,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Column(
          children: [
            for(int i=0; i<navIcons.length; i++)
              ListTile(
                leading: Icon(navIcons[i], color: whitePrimary,),
                title: CustomTextWidget(text: navItems[i], color: whitePrimary, size: 16, fontWeight: FontWeight.bold,),
                contentPadding: EdgeInsets.symmetric(horizontal: 30),
                onTap: ()=>onNavTap(i),
              )
            ,
            Expanded(child: Container(
              alignment: Alignment.bottomCenter,
              child: ListTile(
                leading: Icon(Icons.close, color: whitePrimary),
                title: CustomTextWidget(text: 'Close', color: whitePrimary, size: 16, fontWeight: FontWeight.bold,),
                onTap: ()=>Navigator.pop(context),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
