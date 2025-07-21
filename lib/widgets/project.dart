import 'package:flutter/material.dart';
import 'package:portofolio/core/constant/color_app.dart';
import 'package:portofolio/core/constant/projects.dart';
import 'package:url_launcher/url_launcher.dart';

import 'custom_text_widget.dart';

class Project extends StatelessWidget {
  const Project({super.key});

  @override
  Widget build(BuildContext context) {
    return
      Container(
        width: double.maxFinite,
        padding: EdgeInsets.symmetric(vertical: 60),
        child: Column(
          children: [
            CustomTextWidget(text: "Work Project", size: 24, fontWeight: FontWeight.bold, color: whitePrimary),
            SizedBox(height: 50),
            Wrap(
              runSpacing: 20,
              spacing: 10,
              children: projects.map((value)=>itemProject(context, value)).toList(),
            ),
            SizedBox(height: 100),
            CustomTextWidget(text: "Hobby Project", size: 24, fontWeight: FontWeight.bold, color: whitePrimary),
            SizedBox(height: 50),
            Wrap(
              runSpacing: 20,
              spacing: 10,
              children: projects.map((value)=>itemProject(context, value)).toList(),
            )
          ],
        ),
      );
  }

  Widget itemProject(context, value){
    final size = MediaQuery.of(context).size;
    return ConstrainedBox(
      constraints: BoxConstraints(
          maxWidth: 330,
          maxHeight: 300
      ),
      child: Container(
        decoration: BoxDecoration(
            color: bgLight1,
            borderRadius: BorderRadius.circular(10)
        ),
        child: Column(
          children: [
            //thumbnail
            Container(
              height: size.height/5.5,
              width: 350,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                image: DecorationImage(
                  image: AssetImage(value['img']),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            //desc
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 13),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextWidget(text: value['title'], color: whitePrimary, size: 18, fontWeight: FontWeight.bold,),
                  SizedBox(height: 15),
                  CustomTextWidget(text: value['desc'], color: whitePrimary, size: 12, height: 1.6,)
                ],
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: bgLight2,
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10))
                ),
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomTextWidget(text: 'Available on :', color: Colors.yellow, size: 10),
                    Row(
                      children: [
                        InkWell(
                            onTap: ()=>_launchUrl(value['links']),
                            child: Image.asset('assets/portofolio/apple_white_icon.png', width: 18)
                        ),
                        SizedBox(width: 5),
                        InkWell(
                            onTap: ()=>_launchUrl(value['links']),
                            child: Image.asset('assets/portofolio/android_white_icon.png', width: 18,)
                        ),
                      ],
                    )

                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> _launchUrl(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch $url');
    }
  }
}
