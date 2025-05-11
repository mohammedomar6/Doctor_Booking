import 'package:doctor_booking1/constant/my_colours.dart';
import 'package:doctor_booking1/constant/my_images.dart';
import 'package:doctor_booking1/constant/my_strings.dart';
import 'package:doctor_booking1/features/auth/presentation/screen/login_page.dart';
import 'package:flutter/material.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> _pages = [
    {
      "title": MyStrings.titleIntro1 ,
      "subtitle": MyStrings.subTitleIntro1,
      "image": MyImages.introImage1,
    },
    {
      "title": MyStrings.titleIntro2,
      "subtitle": MyStrings.subTitleIntro2,
      "image": MyImages.introImage2,
    },
    {
      "title": MyStrings.titleIntro3,
      "subtitle": MyStrings.subTitleIntro3,
      "image": MyImages.introImage3,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: _pages.length,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemBuilder: (context, index) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    _pages[index]['image']!,
                    height: MediaQuery.of(context).size.height * 0.4,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.08,
                      vertical: MediaQuery.of(context).size.height * 0.03,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        Text(
                          _pages[index]['title']!,
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium
                              ?.copyWith(
                                fontWeight: FontWeight.bold,
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.07,
                              ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        Text(
                          _pages[index]['subtitle']!,
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(
                                color: Colors.grey[600],
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.045,
                              ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.05,
            right: MediaQuery.of(context).size.width * 0.05,
            child: TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginPage(),
                  ),
                );
              },
              child: Text(
                'SKIP',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: MyColours.blue,
                  fontSize: MediaQuery.of(context).size.width * 0.045,
                ),
              ),
            ),
          ),
          if (_currentPage > 0)
            Positioned(
              bottom: MediaQuery.of(context).size.height * 0.05,
              left: MediaQuery.of(context).size.width * 0.05,
              child: FloatingActionButton(
                shape: const CircleBorder(),
                onPressed: () {
                  _pageController.previousPage(
                    duration: const Duration(
                      milliseconds: 300,
                    ),
                    curve: Curves.easeIn,
                  );
                },
                backgroundColor: MyColours.blue,
                child: Icon(
                  Icons.arrow_back,
                  color: MyColours.white,
                ),
              ),
            ),
          Positioned(
            bottom: MediaQuery.of(context).size.height * 0.05,
            right: MediaQuery.of(context).size.width * 0.05,
            child: FloatingActionButton(
              shape: const CircleBorder(),
              onPressed: () {
                if (_currentPage < _pages.length - 1) {
                  _pageController.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeIn,
                  );
                } else {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginPage(),
                    ),
                  );
                }
              },
              backgroundColor: MyColours.blue,
              child: Icon(
                Icons.arrow_forward,
                color: MyColours.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
