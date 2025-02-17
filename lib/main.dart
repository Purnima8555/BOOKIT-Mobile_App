import 'package:bookit_flutter_project/app/app.dart';
import 'package:bookit_flutter_project/app/di/di.dart';
import 'package:bookit_flutter_project/core/network/hive_service.dart';
import 'package:bookit_flutter_project/features/auth/presentation/view_model/login/login_bloc.dart';
import 'package:bookit_flutter_project/features/auth/presentation/view_model/signup/register_bloc.dart';
import 'package:bookit_flutter_project/features/auth/presentation/view_model/user/user_bloc.dart';
import 'package:bookit_flutter_project/features/explore/presentation/view_model/explore_bloc.dart';
import 'package:bookit_flutter_project/features/home/presentation/view_model/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveService.init();
  await initDependencies();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<LoginBloc>(
          create: (context) => getIt<LoginBloc>(), // Providing LoginBloc
        ),
        BlocProvider<RegisterBloc>(
          create: (context) => getIt<RegisterBloc>(), // Provide RegisterBloc
        ),
        BlocProvider<HomeBloc>(
          create: (context) => getIt<HomeBloc>(), // Provide HomeBloc
        ),
        BlocProvider<ExploreBloc>(
          create: (context) => getIt<ExploreBloc>(), // Provide ExploreBloc
        ),
        BlocProvider<UserBloc>(
          create: (context) =>
              getIt<UserBloc>()..add(LoadUser()), // Provide UserBloc
        ),
      ],
      child: const App(),
    ),
  );
}
