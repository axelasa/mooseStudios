import 'package:flutter/material.dart';
import 'package:moose_studios/constants/screen_size.dart';
import 'package:moose_studios/utils/mobile_drawer.dart';
import 'package:moose_studios/widgets/desktop/desktop_home.dart';
import 'package:moose_studios/widgets/desktop/desktop_services.dart';
import 'package:moose_studios/widgets/desktop/header_desktop.dart';
import 'package:moose_studios/widgets/mobile/header_mobile.dart';
import 'package:moose_studios/widgets/mobile/mobile_samples.dart';
import 'package:moose_studios/widgets/mobile/mobile_services.dart';
import '../constants/colors.dart';
import '../widgets/contact_section.dart';
import '../widgets/desktop/desktop_samples.dart';
import '../widgets/mobile/mobile_home.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final scrollController = ScrollController();
  final List<GlobalKey> navbarKeys = List.generate(4, (index) => GlobalKey());

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    //Drawer drawer = const Drawer();
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: AppColors.scaffoldBg,
          endDrawer: constraints.maxWidth >= minDesktopWidth
              ? null
              : MobileDrawer(onNavItemTap: (int navIndex) {
            //close drawer
            scaffoldKey.currentState?.closeEndDrawer();
            //call func
            scrollToSection(navIndex);
          },
          ),
          body: Flex(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            direction: Axis.vertical,
            children: [
              constraints.maxWidth >= minDesktopWidth
                  ?  HeaderDesktop(
                onNavMenuTap: (int navIndex) {
                  scrollToSection(navIndex);
                },
              )
                  : HeaderMobile(
                      onLogoTap: () {},
                      onMenuTap: () {
                        scaffoldKey.currentState?.openEndDrawer();
                      },
                    ),
               Expanded(
                child: SingleChildScrollView(
                  controller: scrollController,
                  scrollDirection: Axis.vertical,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        key: navbarKeys.first,
                      ),
                      //Home
                      constraints.maxWidth >= minDesktopWidth
                      ?const DesktopHome()
                      :const MobileHome(),

                       //Services
                      constraints.maxWidth >= minDesktopWidth
                      ? DesktopServices(
                        key: navbarKeys[1],
                      )
                      : MobileServices(
                        key: navbarKeys[1],
                      ),

                      //Samples Section
                      constraints.maxWidth >= minDesktopWidth
                      ? DesktopSamples(
                        key: navbarKeys[2],
                      )
                      : MobileSamples(
                        key: navbarKeys[2],
                      ),
                      //Contact Section
                       ContactSection(
                        key: navbarKeys[3],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void scrollToSection(int navIndex) {
    final key = navbarKeys[navIndex];
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }
}
