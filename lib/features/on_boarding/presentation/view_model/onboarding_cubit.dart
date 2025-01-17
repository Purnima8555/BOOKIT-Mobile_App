import 'package:bookit_flutter_project/features/auth/presentation/view/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(OnboardingInitial());

  final PageController pageController = PageController();

  int currentPage = 0;

  final List<Map<String, String>> onboardingData = [
    {
      "title": "Welcome to BookIt!",
      "subtitle": "Where stories meet their readers...",
      "image": "assets/gifs/welcome.gif",
    },
    {
      "title": "Discover Your Next Read!",
      "subtitle": "From classics to bestsellers, we’ve got it all.",
      "image": "assets/gifs/read_book.gif",
    },
    {
      "title": "Begin Your BookIt Journey!",
      "subtitle": "Timeless stories, endless possibilities.",
      "image": "assets/gifs/get_started.gif",
    },
  ];

  void onPageChanged(int page) {
    currentPage = page;
    emit(OnboardingPageChanged(page));
  }

  void nextPage() {
    if (currentPage < onboardingData.length - 1) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
      );
    }
  }

  VoidCallback goToRegisterView(BuildContext context) {
    return () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => LoginView(),
        ),
      );
    };
  }
}

abstract class OnboardingState {}

class OnboardingInitial extends OnboardingState {}

class OnboardingPageChanged extends OnboardingState {
  final int page;
  OnboardingPageChanged(this.page);
}
