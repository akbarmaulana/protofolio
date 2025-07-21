import 'package:flutter/material.dart';
import 'package:portofolio/pages/home_page_portofolio.dart';

class MainPortofolio extends StatelessWidget {
  const MainPortofolio();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: HomePagePortofolio(),
      // child: ResponsiveLayout(
      //   mobileWidget: MobileScaffold(),
      //   tabletWidget: TabletScaffold(),
      //   desktopWidget: HomePagePortofolio(),
      // ),
    );
  }
}
