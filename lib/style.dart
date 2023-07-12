import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

screenBackground(context) {
  return SvgPicture.asset(
    'assets/images/bg.svg',
    alignment: Alignment.center,
    width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.height,
    fit: BoxFit.cover,
  );
}
