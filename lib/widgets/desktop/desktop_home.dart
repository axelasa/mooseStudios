import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mouse_follower/mouse_follower.dart';

import '../../constants/colors.dart';
import '../../constants/intro_paragraph.dart';
import '../../constants/intro_text.dart';

class DesktopHome extends StatefulWidget {
  const DesktopHome({super.key});

  @override
  State<DesktopHome> createState() => _DesktopHomeState();
}


class _DesktopHomeState extends State<DesktopHome> {

  final Map<String, Image> _loadedImages = {};

  @override
  void initState() {
    super.initState();
    _preloadImages();
  }

  void _preloadImages() {
    for (String word in words) {
      final image = Image.asset(wordImages[word]!, fit: BoxFit.fill);
      image.image.resolve(const ImageConfiguration()).addListener(
        ImageStreamListener(
              (info, call) {
            setState(() {
              _loadedImages[word] = image;
            });
          },
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 800,
      width: double.maxFinite,
      color: AppColors.scaffoldBg,
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
                        size: const Size(500,500),
                        alignment: Alignment.centerRight,
                            child: kIsWeb
                            ?ClipOval(
                              child: _loadedImages.containsKey(word)
                                  ? SizedBox(
                                height: 500,
                                width: 500,
                                child: _loadedImages[word]!,
                              )
                                  : Container(
                                height: 600,
                                width: 600,
                                color: Colors.grey, // Placeholder color
                              ),
                            )
                            // ?ClipOval(
                            //   child: Image.asset(
                            //     wordImages[word]!,
                            //     height:800 ,
                            //     width: 800,
                            //     fit: BoxFit.fill,
                            //     filterQuality: FilterQuality.high,
                            //     gaplessPlayback: true,
                            //   ),
                            // )
                                : Image.asset("assets/logo/moose.png",
                                    fit: BoxFit.fill),
                          ),
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