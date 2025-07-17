import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgHelper {
  static SvgPicture asset(
    String assetName, {
    double? width,
    double? height,
    Color? color,
  }) {
    return SvgPicture.asset(
      assetName,
      
      width: width,
      height: height,
      alignment: Alignment.center,
    );
  }
}
