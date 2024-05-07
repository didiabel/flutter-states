import 'package:flutter/material.dart';
import 'package:flutterstates/common/app_styles.dart';
import 'package:flutterstates/widgets/activity_indicator.dart';

class LoadingDialog {
  static BuildContext? _dialogContext;
  static void dismiss() {
    if (_dialogContext != null) {
      Navigator.of(_dialogContext!, rootNavigator: true).pop();
      _dialogContext = null;
    }
  }

  static show(BuildContext context) {
    final AppStyles appStyles = AppStyles.instance;

    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        _dialogContext = context;
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
                child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              clipBehavior: Clip.hardEdge,
              child: Container(
                  padding: const EdgeInsets.all(10),
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomActivityIndicator(size: 4),
                      Text("Loading", style: appStyles.blackBoldText15)
                    ],
                  )),
            )),
          ],
        );
      },
    );
  }
}
