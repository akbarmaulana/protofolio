import 'package:flutter/material.dart';
import 'package:portofolio/core/constant/color_app.dart';
import 'package:portofolio/core/constant/skill_items.dart';

import 'custom_text_widget.dart';

class SkillMobile extends StatelessWidget {
  const SkillMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: bgLight1,
      padding: EdgeInsets.only(top: 20, bottom: 50),
      child: Column(
        children: [
          //platform
          for(int i=0; i<platformItems.length; i++)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                width: double.maxFinite,
                margin: EdgeInsets.only(bottom: 5),
                decoration: BoxDecoration(
                    color: bgLight2,
                    borderRadius: BorderRadius.circular(5)
                ),
                child: ListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  leading: Image.asset(platformItems[i]['img'], width: 26,),
                  title: CustomTextWidget(text: platformItems[i]['title'], color: whitePrimary),
                ),
              ),
            ),

          SizedBox(height: 50),
          //skills
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 7),
            child: Wrap(
              alignment: WrapAlignment.center,
              spacing: 10, runSpacing: 10,
              children: skillItems.map((val)=>RawChip(
                backgroundColor: bgLight2,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                ),
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                label: CustomTextWidget(text: val['title'], color: whitePrimary,),
                avatar: Image.asset(val['img'], width: 26,),
              )).toList(),
            ),
          )
        ],
      ),
    );
  }
}
