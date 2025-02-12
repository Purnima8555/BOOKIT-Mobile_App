import 'package:bookit_flutter_project/app/shared_prefs/token_shared_prefs.dart';
import 'package:bookit_flutter_project/core/network/api_service.dart';
import 'package:bookit_flutter_project/core/network/hive_service.dart';
import 'package:bookit_flutter_project/features/auth/data/data_source/local_data_source/auth_local_datasource.dart';
import 'package:bookit_flutter_project/features/auth/data/data_source/remote_data_source/auth_remote_datasource.dart';
import 'package:bookit_flutter_project/features/auth/data/repository/auth_local_repositroy/auth_local_repository.dart';
import 'package:bookit_flutter_project/features/auth/data/repository/auth_remote_repository/auth_remote_repository.dart';
import 'package:bookit_flutter_project/features/auth/domain/use_case/login_use_case.dart';
import 'package:bookit_flutter_project/features/auth/domain/use_case/register_use_case.dart';
import 'package:bookit_flutter_project/features/auth/domain/use_case/upload_image_use_case.dart';
import 'package:bookit_flutter_project/features/auth/presentation/view_model/login/login_bloc.dart';
import 'package:bookit_flutter_project/features/auth/presentation/view_model/signup/register_bloc.dart';
import 'package:bookit_flutter_project/features/on_boarding/presentation/view_model/onboarding_cubit.dart';
import 'package:bookit_flutter_project/features/splash/presentation/view_model/splash_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future<void> initDependencies() async {
  // First initialize hive service
  await _initHiveService();
  await _initApiService();
  await _initSharedPreferences();

  await _initRegisterDependencies();
  await _initLoginDependencies();
  await _initOnboardingDependencies();
  await _initSplashScreenDependencies();
}

_initHiveService() {
  getIt.registerLazySingleton<HiveService>(() => HiveService());
}

_initApiService() {
  // Remote Data Source
  getIt.registerLazySingleton<Dio>(
    () => ApiService(Dio()).dio,
  );
}

Future<void> _initSharedPreferences() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
}

_initRegisterDependencies() {
  // =========================== Data Source ===========================
  getIt.registerLazySingleton(
    () => AuthLocalDataSource(getIt<HiveService>()),
  );

  getIt.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSource(getIt<Dio>()),
  );

  // =========================== Repository ===========================
  getIt.registerLazySingleton(
    () => AuthLocalRepository(getIt<AuthLocalDataSource>()),
  );

  getIt.registerLazySingleton<AuthRemoteRepository>(
    () => AuthRemoteRepository(getIt<AuthRemoteDataSource>()),
  );

  // =========================== Usecases ===========================
  // getIt.registerLazySingleton<RegisterUseCase>(
  //   () => RegisterUseCase(
  //     getIt<AuthLocalRepository>(),
  //   ),
  // );

  getIt.registerLazySingleton<RegisterUseCase>(
    () => RegisterUseCase(
      getIt<AuthRemoteRepository>(),
    ),
  );

  getIt.registerLazySingleton<UploadImageUsecase>(
    () => UploadImageUsecase(
      getIt<AuthRemoteRepository>(),
    ),
  );

  getIt.registerFactory<RegisterBloc>(
    () => RegisterBloc(
      registerUseCase: getIt(),
      uploadImageUsecase: getIt(),
    ),
  );
}

_initLoginDependencies() {
// =========================== Token Shared Preferences ===========================
  getIt.registerLazySingleton<TokenSharedPrefs>(
    () => TokenSharedPrefs(getIt<SharedPreferences>()),
  );
  
  // =========================== Usecases ===========================
  getIt.registerLazySingleton<LoginUseCase>(
    () => LoginUseCase(
      getIt<AuthRemoteRepository>(),
      getIt<TokenSharedPrefs>(),
    ),
  );

  // getIt.registerLazySingleton<LoginUseCase>(
  //   () => LoginUseCase(
  //     getIt<AuthLocalRepository>(),
  //   ),
  // );

  getIt.registerFactory<LoginBloc>(
    () => LoginBloc(
      registerBloc: getIt<RegisterBloc>(),
      loginUseCase: getIt<LoginUseCase>(),
    ),
  );
}

_initOnboardingDependencies() {
  // Register OnboardingCubit
  getIt.registerFactory<OnboardingCubit>(
    () => OnboardingCubit(),
  );
}

_initSplashScreenDependencies() async {
  getIt.registerFactory<SplashCubit>(
    () => SplashCubit(getIt<LoginBloc>()),
  );
}
