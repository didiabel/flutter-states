import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppStyles {
  AppStyles._();
  static final AppStyles instance = AppStyles._();

  // Themes
  ThemeData appTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: const Color.fromRGBO(117, 197, 249, 1),
    errorColor: const Color.fromARGB(255, 236, 67, 54),
    disabledColor: const Color.fromARGB(255, 133, 133, 133),
    backgroundColor: Colors.white,
  );
  AppBarTheme appBarTheme = const AppBarTheme(
    backgroundColor: Color.fromRGBO(117, 197, 249, 1),
  );

  // EdgeInsets (paddings/margins)
  EdgeInsets noEdge = const EdgeInsets.all(0);
  EdgeInsets edge2 = const EdgeInsets.all(2);
  EdgeInsets edge3 = const EdgeInsets.all(3);
  EdgeInsets edge5 = const EdgeInsets.all(5);
  EdgeInsets edge6 = const EdgeInsets.all(6);
  EdgeInsets edge8 = const EdgeInsets.all(8);
  EdgeInsets edge10 = const EdgeInsets.all(10);
  EdgeInsets edge15 = const EdgeInsets.all(15);
  EdgeInsets edge25 = const EdgeInsets.all(25);
  EdgeInsets edgeTop1 = const EdgeInsets.only(top: 1);
  EdgeInsets edgeTop4 = const EdgeInsets.only(top: 4);
  EdgeInsets edgeTop5 = const EdgeInsets.only(top: 5);
  EdgeInsets edgeTop10 = const EdgeInsets.only(top: 10);
  EdgeInsets edgeTop20 = const EdgeInsets.only(top: 20);
  EdgeInsets edgeLeft5 = const EdgeInsets.only(left: 5);
  EdgeInsets edgeLeft10 = const EdgeInsets.only(left: 10);
  EdgeInsets edgeLeft15 = const EdgeInsets.only(left: 15);
  EdgeInsets edgeRight5 = const EdgeInsets.only(right: 5);
  EdgeInsets edgeRight8 = const EdgeInsets.only(right: 8);
  EdgeInsets edgeRight10 = const EdgeInsets.only(right: 10);
  EdgeInsets edgeRight15 = const EdgeInsets.only(right: 15);
  EdgeInsets edgeBottom5 = const EdgeInsets.only(bottom: 5);
  EdgeInsets edgeBottom10 = const EdgeInsets.only(bottom: 10);
  EdgeInsets edgeVertical3 = const EdgeInsets.symmetric(vertical: 3);
  EdgeInsets edgeVertical5 = const EdgeInsets.symmetric(vertical: 5);
  EdgeInsets edgeVertical8 = const EdgeInsets.symmetric(vertical: 8);
  EdgeInsets edgeVertical10 = const EdgeInsets.symmetric(vertical: 10);
  EdgeInsets edgeVertical15 = const EdgeInsets.symmetric(vertical: 15);
  EdgeInsets edgeVertical20 = const EdgeInsets.symmetric(vertical: 20);
  EdgeInsets edgeVertical70 = const EdgeInsets.symmetric(vertical: 70);
  EdgeInsets edgeHorizontal5 = const EdgeInsets.symmetric(horizontal: 5);
  EdgeInsets edgeHorizontal10 = const EdgeInsets.symmetric(horizontal: 10);
  EdgeInsets edgeHorizontal15 = const EdgeInsets.symmetric(horizontal: 15);

  EdgeInsets edgeHorizontal20AndBottom40 =
      const EdgeInsets.only(bottom: 40, right: 20, left: 20);

  // Text styles
  TextStyle defaultStruckText = const TextStyle(
    decoration: TextDecoration.lineThrough,
    color: Colors.black,
    fontSize: 14,
    fontWeight: FontWeight.normal,
  );
  TextStyle defaultText = const TextStyle(
      color: Colors.black, fontSize: 14, fontWeight: FontWeight.normal);

  TextStyle blackText = const TextStyle(color: Colors.black);
  TextStyle blackText12 = const TextStyle(fontSize: 12, color: Colors.black);
  TextStyle blackText15 = const TextStyle(fontSize: 15, color: Colors.black);
  TextStyle blackText16 = const TextStyle(fontSize: 16, color: Colors.black);
  TextStyle blackText18 = const TextStyle(fontSize: 18, color: Colors.black);
  TextStyle blackText20 = const TextStyle(fontSize: 20, color: Colors.black);
  TextStyle blackText24 = const TextStyle(fontSize: 24, color: Colors.black);

  TextStyle blackBoldText15 = const TextStyle(
    fontSize: 15,
    color: Colors.black,
    fontWeight: FontWeight.bold,
  );
  TextStyle blackBoldText17 = const TextStyle(
    fontSize: 17,
    color: Colors.black,
    fontWeight: FontWeight.bold,
  );

  TextStyle blackBoldText18 = const TextStyle(
    fontSize: 17,
    color: Colors.black,
    fontWeight: FontWeight.bold,
  );

  TextStyle blueText14 =
      const TextStyle(fontSize: 14, color: Color.fromARGB(255, 0, 153, 255));
  TextStyle blueText16 =
      const TextStyle(fontSize: 16, color: Color.fromARGB(255, 0, 153, 255));
  TextStyle blueText18 =
      const TextStyle(fontSize: 18, color: Color.fromARGB(255, 0, 153, 255));

  TextStyle blueBoldText14 = const TextStyle(
    fontSize: 14,
    color: Color.fromARGB(255, 0, 153, 255),
    fontWeight: FontWeight.bold,
  );

  TextStyle blueBoldText16 = const TextStyle(
    fontSize: 16,
    color: Color.fromARGB(255, 0, 153, 255),
    fontWeight: FontWeight.bold,
  );

  TextStyle blueBoldText24 = const TextStyle(
    fontSize: 24,
    color: Color.fromARGB(255, 0, 153, 255),
    fontWeight: FontWeight.bold,
  );

  TextStyle greyText =
      const TextStyle(color: Color.fromARGB(255, 168, 182, 197));
  TextStyle greyText11 =
      const TextStyle(fontSize: 11, color: Color.fromARGB(255, 168, 182, 197));
  TextStyle greyText13 =
      const TextStyle(fontSize: 13, color: Color.fromARGB(255, 168, 182, 197));
  TextStyle greyText15 =
      const TextStyle(fontSize: 15, color: Color.fromARGB(255, 126, 126, 126));
  TextStyle greyText14 =
      const TextStyle(fontSize: 14, color: Color.fromARGB(255, 126, 126, 126));
  TextStyle greyText16 =
      const TextStyle(fontSize: 16, color: Color.fromARGB(255, 126, 126, 126));
  TextStyle greyText18 =
      const TextStyle(fontSize: 18, color: Color.fromARGB(255, 126, 126, 126));

  TextStyle greyBoldText14 = const TextStyle(
    fontSize: 14,
    color: Colors.grey,
    fontWeight: FontWeight.bold,
  );

  TextStyle greyBoldText16 = const TextStyle(
    fontSize: 16,
    color: Colors.grey,
    fontWeight: FontWeight.bold,
  );

  TextStyle redText14 =
      const TextStyle(fontSize: 14, color: Color.fromARGB(255, 236, 67, 54));

  TextStyle whiteText13 = const TextStyle(fontSize: 13, color: Colors.white);
  TextStyle whiteText18 = const TextStyle(fontSize: 18, color: Colors.white);
  TextStyle lightWhiteText18 = const TextStyle(
    fontSize: 18,
    color: Colors.white,
    fontWeight: FontWeight.w400,
  );

  // Colors
  Color black = Colors.black;
  Color white = Colors.white;
  Color green = Colors.green;
  Color red = Colors.red;
  Color warningColor = const Color.fromRGBO(226, 183, 27, 1);
  Color grayColor = const Color.fromARGB(255, 168, 182, 197);
  Color darkTransparent = const Color.fromARGB(129, 158, 158, 158);
  Color grey = const Color.fromARGB(255, 190, 190, 190);
  Color lightGrey = const Color.fromARGB(255, 240, 240, 240);
  Color lightGrey2 = const Color.fromARGB(255, 250, 250, 250);
  Color darkGray = const Color.fromARGB(255, 91, 104, 135);
  Color darkPrimaryColor = const Color.fromARGB(255, 0, 153, 255);
  Color opaqueDarkPrimaryColor = const Color.fromARGB(104, 0, 153, 255);
  Color lightPrimaryColor1 = const Color.fromARGB(255, 198, 232, 255);
  Color lightPrimaryColor2 = const Color.fromARGB(255, 174, 223, 255);
  Color listBackgroundColor = const Color.fromARGB(255, 237, 237, 237);
  Color notificationsBadgeText = Colors.white;
  Color notificationsBadgeBackground = Colors.red;
  Color unreadNotificationBackgroundColor = Color.fromRGBO(218, 241, 255, 1);

  // Border
  BorderRadius radius5 = const BorderRadius.all(Radius.circular(5));
  BorderRadius radius10 = const BorderRadius.all(Radius.circular(10));
  BorderRadius radius15 = const BorderRadius.all(Radius.circular(15));
  BorderRadius radius20 = const BorderRadius.all(Radius.circular(20));
  BorderRadius radiusTop15 = const BorderRadius.only(
    topLeft: Radius.circular(15),
    topRight: Radius.circular(15),
  );
  BorderRadius radiusBottom5 = const BorderRadius.only(
    bottomLeft: Radius.circular(5),
    bottomRight: Radius.circular(5),
  );
  ShapeBorder shapeNoRadius =
      const RoundedRectangleBorder(borderRadius: BorderRadius.zero);

  // Other
  BoxShadow containerShadow = const BoxShadow(
    color: Color.fromARGB(255, 177, 177, 177),
    blurRadius: 15,
    spreadRadius: 1,
  );
  SystemUiOverlayStyle statusBar = const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  );
}
