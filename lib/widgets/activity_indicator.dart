import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterstates/common/app_styles.dart';

class RActivityIndicator extends StatelessWidget {
  RActivityIndicator({super.key, required this.size, this.color});
  final AppStyles appStyles = AppStyles.instance;
  final double size;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: appStyles.edge10,
        child: Platform.isAndroid
            ? CircularProgressIndicator(
                color: color ?? appStyles.darkPrimaryColor,
                strokeWidth: size,
              )
            : CupertinoActivityIndicator(
                color: color ?? appStyles.darkPrimaryColor,
                radius: size * 5,
              ));
  }
}
