import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:moose_studios/constants/screen_size.dart';
import 'package:moose_studios/utils/mobile_drawer.dart';
import 'package:moose_studios/widgets/desktop/desktop_home.dart';
import 'package:moose_studios/widgets/desktop/desktop_services.dart';
import 'package:moose_studios/widgets/desktop/header_desktop.dart';
import 'package:moose_studios/widgets/mobile/header_mobile.dart';
import 'package:moose_studios/widgets/mobile/mobile_samples.dart';
import 'package:moose_studios/widgets/mobile/mobile_services.dart';
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
          backgroundColor: Colors.black,
          endDrawer: constraints.maxWidth >= minDesktopWidth
              ? null
              : const MobileDrawer(),
          body: Flex(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            direction: Axis.vertical,
            children: [
              constraints.maxWidth >= minDesktopWidth
                  ? const HeaderDesktop()
                  : HeaderMobile(
                      onLogoTap: () {},
                      onMenuTap: () {
                        scaffoldKey.currentState?.openEndDrawer();
                      },
                    ),
               Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //Home
                      constraints.maxWidth >= minDesktopWidth
                      ?const DesktopHome()
                      :const MobileHome(),

                       //Services
                      constraints.maxWidth >= minDesktopWidth
                      ?const DesktopServices()
                      :const MobileServices(),

                      //Samples Section
                      constraints.maxWidth >= minDesktopWidth
                      ?const DesktopSamples()
                      :const MobileSamples(),
                      //Contact Section
                      const ContactSection(),
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
}
