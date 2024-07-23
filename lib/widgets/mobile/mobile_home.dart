import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moose_studios/constants/images.dart';

import '../../constants/colors.dart';
import '../../constants/intro_paragraph.dart';
import '../../constants/intro_text.dart';
class MobileHome extends StatelessWidget {
  const MobileHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 864,
      width: double.maxFinite,
      color: AppColors.scaffoldBg,
      child: Padding(
        padding: const EdgeInsets.only(top:50,left: 20.0, bottom: 80,right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Padding(
              padding:  const EdgeInsets.only(top: 18.0),
              child:  Center(
                child: Image.asset(
                  workLogo, height: 100,
                ),
              ),
            ),
            const SizedBox(height: 40,),
            Padding(
              padding: const EdgeInsets.only(bottom: 18.0),
              child: Text(
                "Bringing Your Moments to Life",
                style: GoogleFonts.sevillana(
                  textStyle: const TextStyle(
                    color: AppColors.whitePrimary,
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
             SizedBox(
              height: 86,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Capturing Moments, Creating Memories.',
                    style: GoogleFonts.playfairDisplay(
                      textStyle: const TextStyle(
                        color: AppColors.whitePrimary,
                        fontSize: 30,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              )
            ),
            const SizedBox(
              height: 50,
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

// Wrap(
// children: words.map((word) {
// return MouseOnHoverEvent(
// customOnHoverMouseStylesStack: [
// MouseStyle(
// animationDuration: const Duration(milliseconds: 0),
// opacity: 0.5,
// size: const Size(400,400),
// alignment: Alignment.centerRight,
// child: Container(
// clipBehavior: Clip.antiAliasWithSaveLayer,
// decoration: const BoxDecoration(
// borderRadius:
// BorderRadius.all(Radius.circular(400),),),
// child: Container(
// decoration:  BoxDecoration(
// borderRadius: BorderRadius.circular(400),
// ),
// clipBehavior: Clip.antiAliasWithSaveLayer,
// child: kIsWeb
// ? Image.network(wordImages[word]!,
// height:400 ,
// width: 400,
// fit: BoxFit.fill,
// filterQuality: FilterQuality.high
// )
//     : Image.asset("assets/logo/moose.png",
// fit: BoxFit.fill),
// ),
// ),
// ),
// ],
// child: Text(
// word,
// style: GoogleFonts.playfairDisplay(
// textStyle: const TextStyle(
// color: AppColors.whitePrimary,
// fontSize: 50,
// fontWeight: FontWeight.w400,
// ),
// ),
// ),
// );
// }).toList(),
// ),