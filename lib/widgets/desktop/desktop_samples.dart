import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/colors.dart';
import '../../constants/work_images.dart';

class DesktopSamples extends StatelessWidget {
  const DesktopSamples({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 600,
      width: double.maxFinite,
      color: AppColors.scaffoldBg,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              "Samples",
              style: GoogleFonts.akshar(
                textStyle: const TextStyle(
                  fontSize: 38,
                  fontWeight: FontWeight.w600,
                  color: AppColors.whitePrimary,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: MasonryGridView.builder(
                shrinkWrap: true,
                itemCount: sampleWork.length,
                gridDelegate:
                const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        sampleWork[index],
                      ),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
