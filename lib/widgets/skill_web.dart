import 'package:flutter/material.dart';
import 'package:portofolio/core/constant/color_app.dart';
import 'package:portofolio/core/constant/skill_items.dart';

import 'custom_text_widget.dart';

class SkillWeb extends StatelessWidget {
  const SkillWeb({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //platform
        ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 450),
          child: Wrap(
            spacing: 5,
            runSpacing: 5,
            children: platformItems.map((val)=>Container(
              width: 200,
              decoration: BoxDecoration(
                  color: bgLight2,
                  borderRadius: BorderRadius.circular(5)
              ),
              child: ListTile(
                leading: Image.asset(val['img'], width: 26,),
                title: CustomTextWidget(text: val['title'], color: whitePrimary,),
              ),
            )).toList(),
          ),
        ),
        SizedBox(width: 50),
        //skills
        Flexible(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 500),
            child: Wrap(
              spacing: 10, runSpacing: 10,
              children: skillItems.map((val)=>Chip(
                backgroundColor: bgLight2,
                // side: BorderSide(color: Colors.transparent),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                label: CustomTextWidget(text: val['title'], color: whitePrimary,),
                avatar: Image.asset(val['img'], width: 26,),
              )).toList(),
            ),
          ),
        )
      ],
    );
  }
}
