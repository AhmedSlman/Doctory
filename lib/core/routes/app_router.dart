import 'package:doctory/core/routes/router_names.dart';
import 'package:doctory/features/auth/presentation/views/change_password.dart';
import 'package:doctory/features/auth/presentation/views/forget_password.dart';
import 'package:doctory/features/auth/presentation/views/login_view.dart';
import 'package:doctory/features/auth/presentation/views/sign_up_view.dart';
import 'package:doctory/features/splash/splash_view.dart';
import 'package:go_router/go_router.dart';

import '../../features/home/presentation/views/home_view.dart';

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
    GoRoute(
      path: RouterNames.home,
      builder: (context, state) => const HomeView(),
    ),
    GoRoute(
      path: RouterNames.forgetPassword,
      builder: (context, state) => VerificationPage(),
    ),
    GoRoute(
      path: RouterNames.changePassword,
      builder: (context, state) => const ChangePassword(),
    ),
  ],
);
