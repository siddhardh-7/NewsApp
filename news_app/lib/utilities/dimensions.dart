import 'package:get/get.dart';

class Dimensions {
  static double screenHeight = Get.context!.height; //820 for my screen
  static double screenWidth = Get.context!.width; //410 for my screen

  static double height10 = screenHeight / 82;
  static double width10 = screenWidth / 41;

  static double padding20 = screenWidth / 20.5;

  static double borderRadius12 = screenHeight / 68.3333333333;
  static double borderRadius5 = screenHeight / 164;

  static double loginTopMargin = screenHeight / 3.72727272727;
  static double loginLogoHeight = screenHeight / 13.2258064516;
  static double loginSizedHeight = screenHeight / 10.9333333333;
}
