import 'package:bookit_flutter_project/core/network/hive_service.dart';
import 'package:bookit_flutter_project/features/auth/data/data_source/local_data_source/auth_local_datasource.dart';
import 'package:bookit_flutter_project/features/auth/data/repository/auth_local_repositroy/auth_local_repository.dart';
import 'package:bookit_flutter_project/features/auth/domain/use_case/login_use_case.dart';
import 'package:bookit_flutter_project/features/auth/domain/use_case/register_use_case.dart';
import 'package:bookit_flutter_project/features/auth/presentation/view_model/login/login_bloc.dart';
import 'package:bookit_flutter_project/features/auth/presentation/view_model/signup/register_bloc.dart';
import 'package:bookit_flutter_project/features/on_boarding/presentation/view_model/onboarding_cubit.dart';
import 'package:bookit_flutter_project/features/splash/presentation/view_model/splash_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> initDependencies() async {
  // First initialize hive service
  await _initHiveService();

  await _initRegisterDependencies();
  await _initLoginDependencies();
  await _initOnboardingDependencies();
  await _initSplashScreenDependencies();
}

_initHiveService() {
  getIt.registerLazySingleton<HiveService>(() => HiveService());
}

_initRegisterDependencies() {
  // init local data source
  getIt.registerLazySingleton(
    () => AuthLocalDataSource(getIt<HiveService>()),
  );

  // init local repository
  getIt.registerLazySingleton(
    () => AuthLocalRepository(getIt<AuthLocalDataSource>()),
  );

  // register use case
  getIt.registerLazySingleton<RegisterUseCase>(
    () => RegisterUseCase(
      getIt<AuthLocalRepository>(),
    ),
  );

  getIt.registerFactory<RegisterBloc>(
    () => RegisterBloc(
      registerUseCase: getIt(),
    ),
  );
}

_initLoginDependencies() {
  getIt.registerLazySingleton<LoginUseCase>(
    () => LoginUseCase(
      getIt<AuthLocalRepository>(),
    ),
  );

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
