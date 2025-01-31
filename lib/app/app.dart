import 'package:bookit_flutter_project/app/di/di.dart';
import 'package:bookit_flutter_project/core/theme/app_theme.dart';
import 'package:bookit_flutter_project/features/on_boarding/presentation/view/onboarding_view.dart';
import 'package:bookit_flutter_project/features/on_boarding/presentation/view_model/onboarding_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BookIt!',
      theme: AppTheme.getApplicationTheme(isDarkMode: false),
      home: BlocProvider.value(
        value: getIt<OnboardingCubit>(),
        child: const OnboardingView(),
      ),
    );
  }
}
