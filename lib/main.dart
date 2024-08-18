import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app.dart';

void main() {
  // Set the system UI overlay style
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
    ),
  );

  runApp(
    const Doctory(),
  );
}
