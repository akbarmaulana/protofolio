import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:portofolio/core/constant/color_app.dart';
import 'package:portofolio/core/constant/size.dart';
import 'package:portofolio/widgets/contact.dart';
import 'package:portofolio/widgets/custom_text_widget.dart';
import 'package:portofolio/widgets/drawer_mobile.dart';
import 'package:portofolio/widgets/footer.dart';
import 'package:portofolio/widgets/header_mobile.dart';
import 'package:portofolio/widgets/header_web.dart';
import 'package:portofolio/widgets/main_desktop.dart';
import 'package:portofolio/widgets/main_mobile.dart';
import 'package:portofolio/widgets/project.dart';
import 'package:portofolio/widgets/skill_mobile.dart';
import 'package:portofolio/widgets/skill_web.dart';

class HomePagePortofolio extends StatefulWidget {
  @override
  State<HomePagePortofolio> createState() => _HomePagePortofolioState();
}

class _HomePagePortofolioState extends State<HomePagePortofolio> {

  final scaffoldKey = GlobalKey<ScaffoldState>();
  ScrollController controller = ScrollController();
  List<GlobalKey> navKeys = List.generate(4, (index)=>GlobalKey());
  // const HomePagePortofolio({super.key});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return LayoutBuilder(
      builder: (context, constraints){
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: bgScaffold,
          endDrawer: constraints.maxWidth >= kMinDesktopWidth ? null : DrawerMobile(onNavTap: (index){
            scaffoldKey.currentState?.closeEndDrawer();
            scrollToSection(index);
          }),
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            controller: controller,
            child: Column(
              children: [
                SizedBox(key: navKeys.first,),
                //header nav
                constraints.maxWidth >= kMinDesktopWidth ? HeaderPortofolio(onNavTap: (index)=>scrollToSection(index)) :
                HeaderMobile(
                  onLogoTap: (){},
                  onMenuTap: ()=>scaffoldKey.currentState?.openEndDrawer(),
                ),
                //main
                constraints.maxWidth >= kMinDesktopWidth ? MainDesktop():MainMobile(),
                //skills
                Container(
                  key: navKeys[1],
                  width: size.width,
                  color: bgLight1,
                  padding: EdgeInsets.only(top: 20, bottom: 50),
                  child: Column(
                    children: [
                      CustomTextWidget(text: "What can I do", size: 24, fontWeight: FontWeight.bold, color: whitePrimary),
                      SizedBox(height: 50),
                      constraints.maxWidth >= kMinDesktopWidth ? SkillWeb():SkillMobile(),
                    ],
                  ),
                ),
                //Projects,
                Project(key: navKeys[2],),
                //Contact
                Contact(key: navKeys[3],),
                //Footer
                Footer()
              ],
            ),
          ),
        );
      },
    );
  }

  void scrollToSection(int navIndex){
    final key = navKeys[navIndex];
    Scrollable.ensureVisible(key.currentContext!, duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
  }
}
