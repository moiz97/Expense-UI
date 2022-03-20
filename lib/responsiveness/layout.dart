import 'package:flutter/material.dart';

class Spacers {
  BuildContext context;
  Spacers({required this.context});
  static Widget verticalSpace(double height) {
    return SizedBox(height: height);
  }

  static Widget horizontalSpace(double width) {
    return SizedBox(width: width);
  }

  static Widget verticalSpaceTiny(context) {
    return verticalSpace(MediaQuery.of(context).size.height * 0.01);
  }

  static Widget verticalSpaceSmall(context) {
    return verticalSpace(MediaQuery.of(context).size.height * 0.02);
  }

  static Widget verticalSpaceMedium(context) {
    return verticalSpace(MediaQuery.of(context).size.height * 0.03);
  }

  static Widget verticalSpaceLarge(context) {
    return verticalSpace(MediaQuery.of(context).size.height * 0.05);
  }

  static Widget horizontalSpaceTiny(context) {
    return horizontalSpace(MediaQuery.of(context).size.width * 0.01);
  }

  static Widget horizontalSpaceSmall(context) {
    return horizontalSpace(MediaQuery.of(context).size.width * 0.02);
  }

  static Widget horizontalSpaceMedium(context) {
    return horizontalSpace(MediaQuery.of(context).size.width * 0.05);
  }

  static Widget horizontalSpaceLarge(context) {
    return horizontalSpace(MediaQuery.of(context).size.width * 0.07);
  }
}
