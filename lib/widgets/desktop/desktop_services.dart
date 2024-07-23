import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

import '../../constants/colors.dart';
import '../../constants/three_d_models.dart';

class DesktopServices extends StatelessWidget {
  const DesktopServices({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1600,
      width: double.maxFinite,
      color: AppColors.scaffoldBg,
      padding: const EdgeInsets.only(left: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top:10.0,bottom: 25,),
            child: Center(
              child: Text(
                "My Services",
                style: GoogleFonts.akshar(
                  textStyle: const TextStyle(
                    fontSize: 38,
                    fontWeight: FontWeight.w600,
                    color: AppColors.whitePrimary,
                  ),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Photography',
                      style: GoogleFonts.akshar(
                        textStyle: const TextStyle(
                          fontSize: 38,
                          fontWeight: FontWeight.w600,
                          color: AppColors.whitePrimary,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const SizedBox(
                      height: 400,
                      width: 380,
                      child: ModelViewer(
                        //backgroundColor: Color.fromARGB(0xFF, 0xEE, 0xEE, 0xEE),
                        withCredentials: true,
                        src: camera,
                        alt: 'CANON DSLR CAMERA',
                        ar: false,
                        autoRotate: true,
                        disableZoom: true,
                        cameraControls: true,
                        interactionPrompt: InteractionPrompt.none,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Videography',
                      style: GoogleFonts.akshar(
                        textStyle: const TextStyle(
                          fontSize: 38,
                          fontWeight: FontWeight.w600,
                          color: AppColors.whitePrimary,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const SizedBox(
                      height: 400,
                      width: 380,
                      child: ModelViewer(
                        //backgroundColor: Color.fromARGB(0xFF, 0xEE, 0xEE, 0xEE),
                        withCredentials: true,
                        src: videoCamera,
                        alt: 'CANON DSLR CAMERA',
                        ar: false,
                        autoRotate: true,
                        disableZoom: true,
                        cameraControls: true,
                        interactionPrompt: InteractionPrompt.none,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Studio Photography',
                      style: GoogleFonts.akshar(
                        textStyle: const TextStyle(
                          fontSize: 38,
                          fontWeight: FontWeight.w600,
                          color: AppColors.whitePrimary,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const SizedBox(
                      height: 400,
                      width: 380,
                      child: ModelViewer(
                        //backgroundColor: Color.fromARGB(0xFF, 0xEE, 0xEE, 0xEE),
                        withCredentials: true,
                        src: studio,
                        alt: 'CANON DSLR CAMERA',
                        ar: false,
                        autoRotate: true,
                        disableZoom: true,
                        cameraControls: true,
                        interactionPrompt: InteractionPrompt.none,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Public Relations',
                      style: GoogleFonts.akshar(
                        textStyle: const TextStyle(
                          fontSize: 38,
                          fontWeight: FontWeight.w600,
                          color: AppColors.whitePrimary,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const SizedBox(
                      height: 400,
                      width: 380,
                      child: ModelViewer(
                        //backgroundColor: Color.fromARGB(0xFF, 0xEE, 0xEE, 0xEE),
                        withCredentials: true,
                        src: publicRelations,
                        alt: 'CANON DSLR CAMERA',
                        ar: false,
                        autoRotate: true,
                        disableZoom: true,
                        cameraControls: true,
                        interactionPrompt: InteractionPrompt.none,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Branding & Marketing',
                      style: GoogleFonts.akshar(
                        textStyle: const TextStyle(
                          fontSize: 38,
                          fontWeight: FontWeight.w600,
                          color: AppColors.whitePrimary,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const SizedBox(
                      height: 400,
                      width: 380,
                      child: ModelViewer(
                        //backgroundColor: Color.fromARGB(0xFF, 0xEE, 0xEE, 0xEE),
                        withCredentials: true,
                        src: marketing,
                        alt: 'CANON DSLR CAMERA',
                        ar: false,
                        autoRotate: true,
                        disableZoom: true,
                        cameraControls: true,
                        interactionPrompt: InteractionPrompt.none,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Drone Services',
                      style: GoogleFonts.akshar(
                        textStyle: const TextStyle(
                          fontSize: 38,
                          fontWeight: FontWeight.w600,
                          color: AppColors.whitePrimary,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const SizedBox(
                      height: 400,
                      width: 380,
                      child: ModelViewer(
                        //backgroundColor: Color.fromARGB(0xFF, 0xEE, 0xEE, 0xEE),
                        withCredentials: true,
                        src: drone,
                        alt: 'CANON DSLR CAMERA',
                        ar: false,
                        autoRotate: true,
                        disableZoom: true,
                        cameraControls: true,
                        interactionPrompt: InteractionPrompt.none,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Live Streaming',
                      style: GoogleFonts.akshar(
                        textStyle: const TextStyle(
                          fontSize: 38,
                          fontWeight: FontWeight.w600,
                          color: AppColors.whitePrimary,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const SizedBox(
                      height: 400,
                      width: 380,
                      child: ModelViewer(
                        //backgroundColor: Color.fromARGB(0xFF, 0xEE, 0xEE, 0xEE),
                        withCredentials: true,
                        src: streaming,
                        alt: 'CANON DSLR CAMERA',
                        ar: false,
                        autoRotate: true,
                        disableZoom: true,
                        cameraControls: true,
                        interactionPrompt: InteractionPrompt.none,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Events Coverage',
                      style: GoogleFonts.akshar(
                        textStyle: const TextStyle(
                          fontSize: 38,
                          fontWeight: FontWeight.w600,
                          color: AppColors.whitePrimary,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const SizedBox(
                      height: 400,
                      width: 380,
                      child: ModelViewer(
                        //backgroundColor: Color.fromARGB(0xFF, 0xEE, 0xEE, 0xEE),
                        withCredentials: true,
                        src: events,
                        alt: 'CANON DSLR CAMERA',
                        ar: false,
                        autoRotate: true,
                        disableZoom: true,
                        cameraControls: true,
                        interactionPrompt: InteractionPrompt.none,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
