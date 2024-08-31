import 'package:get_it/get_it.dart';

import '../../features/auth/data/repo/auth_repo_abstract.dart';
import '../../features/auth/data/repo/auth_repo_implementation.dart';
import '../../features/auth/presentation/view_models/cubit/auth_cubit.dart';

final GetIt getIt = GetIt.instance;
void setupLocator() {
  getIt.registerLazySingleton<AuthRepository>(() => AuthRepoImplementation());
  getIt.registerFactory<AuthCubit>(() => AuthCubit(getIt<AuthRepository>()));



}