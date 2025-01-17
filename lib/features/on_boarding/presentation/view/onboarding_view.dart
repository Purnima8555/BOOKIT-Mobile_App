import 'package:bookit_flutter_project/features/on_boarding/presentation/view_model/onboarding_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => OnboardingCubit(),
      child: BlocBuilder<OnboardingCubit, OnboardingState>(
        builder: (context, state) {
          final onboardingCubit = context.read<OnboardingCubit>();
          return Scaffold(
            body: PageView.builder(
              controller: onboardingCubit.pageController,
              itemCount: onboardingCubit.onboardingData.length,
              onPageChanged: onboardingCubit.onPageChanged,
              itemBuilder: (context, index) {
                final pageData = onboardingCubit.onboardingData[index];
                return OnboardingPage(
                  title: pageData['title']!,
                  subtitle: pageData['subtitle']!,
                  image: pageData['image']!,
                  isLastPage:
                      index == onboardingCubit.onboardingData.length - 1,
                  onNext: onboardingCubit.nextPage,
                  onGetStarted: onboardingCubit.goToRegisterView(context),
                  onSkip: onboardingCubit.goToRegisterView(context),
                );
              },
              physics: const NeverScrollableScrollPhysics(),
            ),
          );
        },
      ),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  final String title;
  final String subtitle;
  final String image;
  final bool isLastPage;
  final VoidCallback onNext;
  final VoidCallback onGetStarted;
  final VoidCallback onSkip;

  const OnboardingPage({
    super.key,
    required this.title,
    required this.subtitle,
    required this.image,
    required this.isLastPage,
    required this.onNext,
    required this.onGetStarted,
    required this.onSkip,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final bool isTablet = screenWidth > 600;

    Color titleColor = const Color(0xFF1E2751);

    return Column(
      children: [
        Expanded(
          flex: 6,
          child: Center(
            child: Image.asset(
              image,
              fit: BoxFit.contain,
            ),
          ),
        ),
        Expanded(
          flex: 4,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: isTablet ? 40.0 : 20.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: isTablet ? 32 : 28,
                    fontWeight: FontWeight.bold,
                    color: titleColor,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: isTablet ? 30 : 20),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: isTablet ? 20 : 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.black54,
                  ),
                  textAlign: TextAlign.center,
                ),
                const Spacer(),
                if (!isLastPage)
                  Row(
                    mainAxisAlignment: isTablet
                        ? MainAxisAlignment.spaceEvenly
                        : MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: onSkip,
                        child: Text(
                          'Skip',
                          style: TextStyle(
                            fontSize: isTablet ? 22 : 20,
                            color: titleColor,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: onNext,
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                            horizontal: isTablet ? 40 : 30,
                            vertical: isTablet ? 20 : 15,
                          ),
                          backgroundColor: titleColor,
                          elevation: 5,
                        ),
                        child: Text(
                          "Next",
                          style: TextStyle(
                            fontSize: isTablet ? 21 : 19,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                if (isLastPage)
                  Center(
                    child: ElevatedButton(
                      onPressed: onGetStarted,
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                          horizontal: isTablet ? 40 : 30,
                          vertical: isTablet ? 20 : 15,
                        ),
                        backgroundColor: titleColor,
                        elevation: 5,
                      ),
                      child: Text(
                        "Get Started",
                        style: TextStyle(
                          fontSize: isTablet ? 21 : 19,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                SizedBox(height: isTablet ? 20 : 10),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
