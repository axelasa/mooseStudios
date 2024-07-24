import 'dart:typed_data';
import 'package:flutter_image_compress/flutter_image_compress.dart';

Future<Uint8List?> testCompressAsset(String assetName) async {
  var list = await FlutterImageCompress.compressAssetImage(
    assetName,
    minHeight: 200,
    minWidth: 200,
    quality: 96,
    rotate: 180,
  );
  return list;
}