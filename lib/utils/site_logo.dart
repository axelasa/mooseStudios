import 'package:flutter/cupertino.dart';

import '../constants/images.dart';

class SiteLogo extends StatelessWidget {
  const SiteLogo({super.key, this.onTap});

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: onTap,
      child: const Image(
        image: AssetImage(
            logo
        ),
      ),
    );
  }
}
