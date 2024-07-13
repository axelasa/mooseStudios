import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mouse_follower/mouse_follower.dart';

import '../../constants/colors.dart';
import '../../constants/intro_paragraph.dart';
import '../../constants/intro_text.dart';

class DesktopHome extends StatelessWidget {
  const DesktopHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 800,
      width: double.maxFinite,
      color: Colors.black,
      child: Padding(
        padding: const EdgeInsets.only(left: 100.0, top: 100, bottom: 80),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Bringing Your Moments to Life",
              style: GoogleFonts.sevillana(
                textStyle: const TextStyle(
                  color: AppColors.whitePrimary,
                  fontSize: 26,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            SizedBox(
              height: 50,
              child: Wrap(
                children: words.map((word) {
                  return MouseOnHoverEvent(
                    onHoverMouseCursor: SystemMouseCursors.click,
                    customOnHoverMouseStylesStack: [
                      MouseStyle(
                        animationDuration: const Duration(milliseconds: 0),
                        opacity: 0.5,
                        size: const Size(400,400),
                        alignment: Alignment.centerRight,
                            child: kIsWeb
                                ? ClipOval(
                                  child: Image.network(wordImages[word]!,
                                      height:800 ,
                                      width: 800,
                                      fit: BoxFit.fill,
                                  filterQuality: FilterQuality.high,
                                                              ),
                                )
                                : Image.asset("assets/logo/moose.png",
                                    fit: BoxFit.fill),
                          ),
                        //),
                      //),
                    ],
                    child: Text(
                      word,
                      style: GoogleFonts.playfairDisplay(
                        textStyle: const TextStyle(
                          color: AppColors.whitePrimary,
                          fontSize: 50,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(
              height: 200,
            ),
            Text(
              intro,
              style: GoogleFonts.anekDevanagari(
                  textStyle: const TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 25,
                      fontStyle: FontStyle.normal,
                      color: Colors.white)),
            )
          ],
        ),
      ),
    );
  }
}
//
// child: Container(
// clipBehavior: Clip.antiAliasWithSaveLayer,
// decoration: const BoxDecoration(
// borderRadius:
// BorderRadius.all(Radius.circular(400),),),
//
// child: Container(
// decoration:  BoxDecoration(
// borderRadius: BorderRadius.circular(400),
// ),
// clipBehavior: Clip.antiAliasWithSaveLayer,