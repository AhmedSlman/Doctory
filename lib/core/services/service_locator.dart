import 'package:get_it/get_it.dart';
import '../../features/auth/data/repo/auth_repo_abstract.dart';
import '../../features/auth/data/repo/auth_repo_implementation.dart';
import '../../features/auth/presentation/view_models/cubit/auth_cubit.dart';
import '../../features/home/data/repo/home_repo.dart';
import '../../features/home/data/repo/home_repo_implementation.dart';
import '../../features/home/presentation/view_models/bottom_nav_bar_cubit/bottom_nav_bar_cubit.dart';
import '../../features/home/presentation/view_models/home_cubit/home_cubit.dart';

final GetIt getIt = GetIt.instance;
void setupLocator() {
  getIt.registerLazySingleton<AuthRepository>(() => AuthRepoImplementation());
  getIt.registerFactory<AuthCubit>(() => AuthCubit(getIt<AuthRepository>()));

  getIt.registerLazySingleton<HomeRepo>(() => HomeRepoImplementation());
  getIt.registerFactory<HomeCubit>(() => HomeCubit(getIt<HomeRepo>()));



}