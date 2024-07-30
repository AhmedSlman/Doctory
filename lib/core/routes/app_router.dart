import 'package:doctory/core/routes/router_names.dart';
import 'package:doctory/features/auth/presentation/views/login_view.dart';
import 'package:doctory/features/auth/presentation/views/sign_up_view.dart';
import 'package:doctory/features/splash/splash_view.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: RouterNames.splash,
      builder: (context, state) => const SplashView(),
    ),
    GoRoute(
      path: RouterNames.login,
      builder: (context, state) => const LoginView(),
    ),
    GoRoute(
      path: RouterNames.signup,
      builder: (context, state) => const SignUpView(),
    ),
  ],
);
