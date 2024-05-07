import 'dart:io';

String exampleRequestGetOS() {
  if (Platform.isAndroid) {
    return 'android';
  }
  return 'ios';
}
