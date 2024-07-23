import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moose_studios/utils/header_icon.dart';
import 'package:moose_studios/utils/site_logo.dart';

import '../../constants/colors.dart';
import '../../constants/header_item.dart';
import '../../constants/images.dart';
import '../../utils/desktop_header_menu.dart';

class HeaderDesktop extends StatelessWidget {
  const HeaderDesktop({super.key, required this.onNavMenuTap});
  final Function(int) onNavMenuTap;

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(14.0),
      child: Container(
          height:60 ,
          width: double.maxFinite,
          decoration:  headerDecorationMenu,
          child:  Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: InkWell(
                  child: SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SiteLogo(
                          onTap: (){},
                        ),
                        const SizedBox(width: 10,),
                        headerIcon
                      ],
                    ),
                  ),
                ),
              ),
              const Spacer(),
              for (int i=0; i<headerTitles.length; i++)
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextButton(
                    onPressed: () {
                      onNavMenuTap(i);
                    },
                    child: Text(
                    headerTitles[i],
                      style: GoogleFonts.akshar(
                        textStyle: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                            fontStyle: FontStyle.normal,
                            color: AppColors.whitePrimary
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          )
      ),
    );
  }
}
