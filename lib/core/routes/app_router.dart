import 'package:doctory/core/routes/router_names.dart';
import 'package:doctory/core/services/service_locator.dart';
import 'package:doctory/features/auth/presentation/view_models/cubit/auth_cubit.dart';
import 'package:doctory/features/auth/presentation/views/change_password.dart';
import 'package:doctory/features/auth/presentation/views/forget_password.dart';
import 'package:doctory/features/auth/presentation/views/login_view.dart';
import 'package:doctory/features/auth/presentation/views/sign_up_view.dart';
import 'package:doctory/features/booking/presentation/views/booking_view.dart';
import 'package:doctory/features/doctor_profile/views/doctor_profile_view.dart';
import 'package:doctory/features/home/presentation/views/botton_nav_bar_view.dart';
import 'package:doctory/features/pharmacies/presentation/views/pharmacies_view.dart';
import 'package:doctory/features/settings/presentation/views/booking_time_view.dart';
import 'package:doctory/features/settings/presentation/views/change_password_view.dart';
import 'package:doctory/features/settings/presentation/views/report_a_problem_view.dart';
import 'package:doctory/features/splash/splash_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../features/home/presentation/views/home_view.dart';
import '../../features/settings/presentation/views/personal_info_view.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: RouterNames.splash,
      builder: (context, state) => const SplashView(),
    ),
    GoRoute(
      path: RouterNames.login,
      builder: (context, state) => BlocProvider(
        create: (context) => getIt<AuthCubit>(),
        child: const LoginView(),
      ),
    ),
    GoRoute(
      path: RouterNames.signup,
      builder: (context, state) =>
          BlocProvider(
            create: (context) => getIt<AuthCubit>(),
            child: const SignUpView(),
          ),
    ),
    GoRoute(
      path: RouterNames.forgetPassword,
      builder: (context, state) => VerificationPage(),
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
    GoRoute(
      path: RouterNames.booking,
      builder: (context, state) => const BookingView(),
    ),
    GoRoute(
      path: RouterNames.bottomNavBar,
      builder: (context, state) => const BottomNavBarView(),
    ),
    GoRoute(
      path: RouterNames.personalInfoView,
      builder: (context, state) => const PersonalInfoView(),
    ),
    GoRoute(
      path: RouterNames.changePasswordView,
      builder: (context, state) => const ChangePasswordView(),
    ),
    GoRoute(
      path: RouterNames.bookingTime,
      builder: (context, state) => const BookingTimeView(),
    ),
    GoRoute(
      path: RouterNames.reportProblemView,
      builder: (context, state) => const ReportAProblemView(),
    ),
    GoRoute(
      path: RouterNames.doctorProfileInfo,
      builder: (context, state) => const DoctorProfileInfoView(),
    ),
  ],
);
