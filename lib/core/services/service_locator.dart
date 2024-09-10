import 'package:doctory/features/booking/data/repo/doctors_repo_implementation.dart';
import 'package:doctory/features/booking/presentation/view_models/cubit/doctors_booking_cubit.dart';
import 'package:doctory/features/pharmacies/data/repo/pharmacies_repo.dart';
import 'package:doctory/features/pharmacies/presentation/view_models/pharmacies_cubit.dart';
import 'package:doctory/features/settings/presentation/view_models/cubit/settings_cubit.dart';
import 'package:get_it/get_it.dart';
import '../../features/auth/data/repo/auth_repo_abstract.dart';
import '../../features/auth/data/repo/auth_repo_implementation.dart';
import '../../features/auth/presentation/view_models/cubit/auth_cubit.dart';
import '../../features/booking/data/repo/doctors_repo.dart';
import '../../features/home/data/repo/home_repo.dart';
import '../../features/home/data/repo/home_repo_implementation.dart';
import '../../features/home/presentation/view_models/home_cubit/home_cubit.dart';
import '../../features/pharmacies/data/repo/pharmacies_repo_implementation.dart';
import '../../features/settings/data/repo/settings_repo.dart';
import '../../features/settings/data/repo/settings_repo_implementation.dart';

final GetIt getIt = GetIt.instance;
void setupLocator() {
  getIt.registerLazySingleton<AuthRepository>(() => AuthRepoImplementation());
  getIt.registerFactory<AuthCubit>(() => AuthCubit(getIt<AuthRepository>()));
//
  getIt.registerLazySingleton<HomeRepo>(() => HomeRepoImplementation());
  getIt.registerFactory<HomeCubit>(() => HomeCubit(getIt<HomeRepo>()));
//
  getIt.registerLazySingleton<PharmaciesRepo>(() => PharmaciesRepoImplementation());
  getIt.registerFactory<PharmaciesCubit>(() => PharmaciesCubit(getIt<PharmaciesRepo>()));

//
  getIt.registerLazySingleton<SettingsRepo>(() => SettingsRepoImplementation());
  getIt.registerFactory<SettingsCubit>(() => SettingsCubit(getIt<SettingsRepo>()));

  //
  getIt.registerLazySingleton<DoctorsRepo>(() => DoctorsRepoImplementation());
  getIt.registerFactory<DoctorsBookingCubit>(() => DoctorsBookingCubit(getIt<DoctorsRepo>()));
}


