import 'package:dio/dio.dart';
import 'package:doctory/core/dataSource/api/api_consumer.dart';
import 'package:doctory/core/dataSource/api/dio_consumer.dart';
import 'package:doctory/core/dataSource/local/cache.dart';

import 'package:doctory/features/booking/data/repo/doctors_repo_implementation.dart';
import 'package:doctory/features/booking/presentation/view_models/cubit/doctors_booking_cubit.dart';
import 'package:doctory/features/doctor_profile/data/repo/doctor_profile_repo.dart';
import 'package:doctory/features/doctor_profile/data/repo/doctor_profile_repo_impl.dart';
import 'package:doctory/features/doctor_profile/cubit/doctor_profile_cubit.dart';
import 'package:doctory/features/home/presentation/view_models/home_cubit/category/category_cubit.dart';
import 'package:doctory/features/home/presentation/view_models/home_cubit/offer/offer_cubit.dart';
import 'package:doctory/features/home/presentation/view_models/home_cubit/offers_by_specialization/offers_by_specialization_cubit.dart';
import 'package:doctory/features/home/presentation/view_models/home_cubit/reserve/reserve_cubit.dart';
import 'package:doctory/features/pharmacies/data/repo/pharmacies_repo.dart';
import 'package:doctory/features/pharmacies/presentation/view_models/pharmacies_cubit.dart';
import 'package:doctory/features/settings/view_models/get_reserve_cubit/reservation_cubit.dart';
import 'package:doctory/features/settings/view_models/password_cubit/update_password_cubit.dart';
import 'package:doctory/features/settings/view_models/problam_cubit/problam_cubit.dart';
import 'package:doctory/features/settings/view_models/profile_cubit/profile_cubit.dart';
import 'package:get_it/get_it.dart';
import '../../features/auth/data/repo/auth_repo_abstract.dart';
import '../../features/auth/data/repo/auth_repo_implementation.dart';
import '../../features/auth/presentation/cubit/auth_cubit.dart';
import '../../features/booking/data/repo/doctors_repo.dart';
import '../../features/home/data/repo/home_repo.dart';
import '../../features/home/data/repo/home_repo_implementation.dart';
import '../../features/pharmacies/data/repo/pharmacies_repo_implementation.dart';
import '../../features/settings/data/repo/settings_repo.dart';
import '../../features/settings/data/repo/settings_repo_implementation.dart';

final GetIt getIt = GetIt.instance;
void setupLocator() {
  getIt.registerSingleton<CacheHelpers>(CacheHelpers());

  getIt.registerLazySingleton<Dio>(() => Dio());

  getIt
      .registerLazySingleton<ApiConsumer>(() => DioConsumer(dio: getIt<Dio>()));
  getIt.registerLazySingleton<AuthRepository>(() => AuthRepoImplementation(
        apiConsumer: getIt<ApiConsumer>(),
      ));
  getIt.registerFactory<AuthCubit>(() => AuthCubit(getIt<AuthRepository>()));
//
  getIt.registerLazySingleton<HomeRepo>(
      () => HomeRepoImplementation(apiConsumer: getIt<ApiConsumer>()));
  getIt.registerFactory<CategoriesCubit>(
      () => CategoriesCubit(getIt<HomeRepo>()));
  getIt.registerFactory<OffersCubit>(() => OffersCubit(getIt<HomeRepo>()));
  getIt.registerFactory<OffersBySpecCubit>(
      () => OffersBySpecCubit(getIt<HomeRepo>()));
  getIt.registerFactory<ReserveOfferCubit>(
      () => ReserveOfferCubit(getIt<HomeRepo>()));

//
  getIt.registerLazySingleton<PharmaciesRepo>(
      () => PharmaciesRepoImplementation(apiConsumer: getIt<ApiConsumer>()));
  getIt.registerFactory<PharmaciesCubit>(
      () => PharmaciesCubit(getIt<PharmaciesRepo>()));

//
  getIt.registerLazySingleton<SettingsRepo>(
      () => SettingsRepoImplementation(apiConsumer: getIt<ApiConsumer>()));
  getIt.registerFactory<ProfileCubit>(
      () => ProfileCubit(settingsRepo: getIt<SettingsRepo>()));
  getIt.registerFactory<PasswordCubit>(
      () => PasswordCubit(getIt<SettingsRepo>()));
  getIt.registerFactory<ReportProblemCubit>(
      () => ReportProblemCubit(getIt<SettingsRepo>()));
  getIt.registerFactory<ReservationCubit>(
      () => ReservationCubit(getIt<SettingsRepo>()));

  //
  getIt.registerLazySingleton<DoctorsRepo>(
      () => DoctorsRepoImplementation(apiConsumer: getIt<ApiConsumer>()));
  getIt.registerFactory<DoctorsCubit>(
      () => DoctorsCubit(doctorsRepo: getIt<DoctorsRepo>()));

// doctor profile
  getIt.registerLazySingleton<DoctorProfileRepo>(
      () => DoctorProfileRepoImpl(apiConsumer: getIt<ApiConsumer>()));

  getIt.registerFactory<DoctorsProfileCubit>(
      () => DoctorsProfileCubit(doctorsRepo: getIt<DoctorProfileRepo>(), ));
}
