import 'package:bookit_flutter_project/authorization/login_view.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();

  int _currentPage = 0;

  final List<Map<String, String>> _onboardingData = [
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

  void _onPageChanged(int page) {
    setState(() {
      _currentPage = page;
    });
  }

  void _nextPage() {
    if (_currentPage < _onboardingData.length - 1) {
      _pageController.nextPage(
        duration: Duration(milliseconds: 200),
        curve: Curves.easeInOut,
      );
    }
  }

  void _goToLoginView() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => LoginView(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: _pageController,
        itemCount: _onboardingData.length,
        onPageChanged: _onPageChanged,
        itemBuilder: (context, index) {
          return OnboardingPage(
            title: _onboardingData[index]['title']!,
            subtitle: _onboardingData[index]['subtitle']!,
            image: _onboardingData[index]['image']!,
            isLastPage: index == _onboardingData.length - 1,
            onNext: _nextPage,
            onGetStarted: _goToLoginView,
            onSkip: _goToLoginView,
          );
        },
        physics: NeverScrollableScrollPhysics(),
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

    Color titleColor = Color(0xFF1E2751); // #1E2751 color

    return Column(
      children: [
        // 60% of the screen for the GIF
        Expanded(
          flex: 6,
          child: Center(
            child: Image.asset(
              image,
              fit: BoxFit.contain, // Ensure the GIF scales properly
            ),
          ),
        ),
        // 40% of the screen for the rest
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
                Spacer(),
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
