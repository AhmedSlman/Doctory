import 'package:doctory/core/routs/router_names.dart';
import 'package:doctory/features/splash/splash_view.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: RouterNames.splash,
      builder: (context, state) => const SplashView(),
    ),
  ],
);
