import 'package:doctor_booking1/constant/my_colours.dart';
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
      "title": "Welcome to Booking App",
      "subtitle": "Book appointments easily with top doctors",
      "image": "assets/images/p1.jpg",
    },
    {
      "title": "Easy to Use",
      "subtitle": "Simple and smooth interface for better user experience",
      "image": "assets/images/p2.jpg",
    },
    {
      "title": "Certified Doctors",
      "subtitle": "We guarantee qualified and experienced doctors",
      "image": "assets/images/p3.jpg",
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
                    padding: const EdgeInsets.all(32.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 16),
                        Text(
                          _pages[index]['title']!,
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium
                              ?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          _pages[index]['subtitle']!,
                          style:
                              Theme.of(context).textTheme.bodyLarge?.copyWith(
                                    color: Colors.grey[600],
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
            top: 40,
            right: 20,
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
                  color: kColor,
                ),
              ),
            ),
          ),
          if (_currentPage > 0)
            Positioned(
              bottom: 40,
              left: 20,
              child: FloatingActionButton(
                shape: const CircleBorder(),
                onPressed: () {
                  _pageController.previousPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeIn,
                  );
                },
                backgroundColor: Colors.blue,
                child: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
              ),
            ),
          Positioned(
            bottom: 40,
            right: 20,
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
              backgroundColor: Colors.blue,
              child: const Icon(
                Icons.arrow_forward,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}