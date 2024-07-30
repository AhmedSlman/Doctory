import 'package:doctory/core/routs/app_router.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Doctory());
}

class Doctory extends StatelessWidget {
  const Doctory({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    );
  }
}
