import 'package:doctor_booking1/constant/my_colours.dart';
import 'package:doctor_booking1/constant/my_images.dart';
import 'package:doctor_booking1/constant/my_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  final PageController _controller = PageController();
  final ValueNotifier<int> _currentIndex = ValueNotifier(0);

  final List<Map<String, String>> pages = [
    {
      "title": MyStrings.titleIntro1,
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
      backgroundColor: MyColours.white,
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          PageView.builder(
            physics: const BouncingScrollPhysics(),
            controller: _controller,
            itemCount: pages.length,
            onPageChanged: (index) => _currentIndex.value = index,
            itemBuilder: (context, index) {
              final page = pages[index];
              return Padding(
                padding: EdgeInsets.all(8.sp),
                child: Padding(
                  padding: EdgeInsets.only(bottom: 210.h),
                  child: Image.asset(
                    page['image']!,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.fitWidth,
                  ),
                ).animate().fade(),
              );
            },
          ),
          Positioned(
            bottom: 0,
            height: MediaQuery.of(context).size.height * 0.40,
            width: MediaQuery.of(context).size.width,
            child: Container(
              margin: EdgeInsets.all(14.sp),
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 14.h),
              decoration: BoxDecoration(
                color: const  Color(0xFF0A0E21),
                borderRadius: BorderRadius.circular(20),
              ),
              child: ValueListenableBuilder<int>(
                valueListenable: _currentIndex,
                builder: (context, index, _) {
                  final page = pages[index];
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        page['title']!,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ).animate().slideX(),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        page['subtitle']!,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 20.sp,
                        ),
                      ).animate().slideX(),
                      SizedBox(
                        height: 16.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(width: 55.w),
                          SmoothPageIndicator(
                            controller: _controller,
                            count: pages.length,
                            effect: ExpandingDotsEffect(
                              dotHeight: 10,
                              dotWidth: 10,
                              spacing: 12,
                              activeDotColor: MyColours.blue,
                              dotColor: MyColours.blue.withOpacity(.5),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              if (index < pages.length - 1) {
                                _controller.nextPage(
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.easeInOut,
                                );
                              } else {
                                Navigator.pushReplacementNamed(
                                    context, '/login');
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: MyColours.blue,
                              fixedSize: Size(75.w, 75.h),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.r),
                              ),
                            ),
                            child: Center(
                              child: Icon(
                                size: 22.sp,
                                Icons.arrow_forward_ios,
                                color: MyColours.lightBlack,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
// class IntroPage extends StatefulWidget {
//   const IntroPage({super.key});
//
//   @override
//   State<IntroPage> createState() => _IntroPageState();
// }
//
// class _IntroPageState extends State<IntroPage> {
//   final PageController _pageController = PageController();
//   int _currentPage = 0;
//
//   final List<Map<String, String>> _pages = [
//     {
//       "title": MyStrings.titleIntro1 ,
//       "subtitle": MyStrings.subTitleIntro1,
//       "image": MyImages.introImage1,
//     },
//     {
//       "title": MyStrings.titleIntro2,
//       "subtitle": MyStrings.subTitleIntro2,
//       "image": MyImages.introImage2,
//     },
//     {
//       "title": MyStrings.titleIntro3,
//       "subtitle": MyStrings.subTitleIntro3,
//       "image": MyImages.introImage3,
//     },
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           PageView.builder(
//             controller: _pageController,
//             itemCount: _pages.length,
//             onPageChanged: (index) {
//               setState(() {
//                 _currentPage = index;
//               });
//             },
//             itemBuilder: (context, index) {
//               return Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Image.asset(
//                     _pages[index]['image']!,
//                     height: MediaQuery.of(context).size.height * 0.4,
//                     width: double.infinity,
//                     fit: BoxFit.cover,
//                   ),
//                   Padding(
//                     padding: EdgeInsets.symmetric(
//                       horizontal: MediaQuery.of(context).size.width * 0.08,
//                       vertical: MediaQuery.of(context).size.height * 0.03,
//                     ),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         SizedBox(
//                           height: MediaQuery.of(context).size.height * 0.02,
//                         ),
//                         Text(
//                           _pages[index]['title']!,
//                           style: Theme.of(context)
//                               .textTheme
//                               .headlineMedium
//                               ?.copyWith(
//                                 fontWeight: FontWeight.bold,
//                                 fontSize:
//                                     MediaQuery.of(context).size.width * 0.07,
//                               ),
//                         ),
//                         SizedBox(
//                           height: MediaQuery.of(context).size.height * 0.02,
//                         ),
//                         Text(
//                           _pages[index]['subtitle']!,
//                           style: Theme.of(context)
//                               .textTheme
//                               .bodyLarge
//                               ?.copyWith(
//                                 color: Colors.grey[600],
//                                 fontSize:
//                                     MediaQuery.of(context).size.width * 0.045,
//                               ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               );
//             },
//           ),
//           Positioned(
//             top: MediaQuery.of(context).size.height * 0.05,
//             right: MediaQuery.of(context).size.width * 0.05,
//             child: TextButton(
//               onPressed: () {
//                 Navigator.pushReplacementNamed(
//                   context,
//                  '/login'
//                 );
//               },
//               child: Text(
//                 'SKIP',
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   color: MyColours.blue,
//                   fontSize: MediaQuery.of(context).size.width * 0.045,
//                 ),
//               ),
//             ),
//           ),
//           if (_currentPage > 0)
//             Positioned(
//               bottom: MediaQuery.of(context).size.height * 0.05,
//               left: MediaQuery.of(context).size.width * 0.05,
//               child: FloatingActionButton(
//                 shape: const CircleBorder(),
//                 onPressed: () {
//                   _pageController.previousPage(
//                     duration: const Duration(
//                       milliseconds: 300,
//                     ),
//                     curve: Curves.easeIn,
//                   );
//                 },
//                 backgroundColor: MyColours.blue,
//                 child: Icon(
//                   Icons.arrow_back,
//                   color: MyColours.white,
//                 ),
//               ),
//             ),
//           Positioned(
//             bottom: MediaQuery.of(context).size.height * 0.05,
//             right: MediaQuery.of(context).size.width * 0.05,
//             child: FloatingActionButton(
//               shape: const CircleBorder(),
//               onPressed: () {
//                 if (_currentPage < _pages.length - 1) {
//                   _pageController.nextPage(
//                     duration: const Duration(milliseconds: 300),
//                     curve: Curves.easeIn,
//                   );
//                 } else {
//                   Navigator.pushReplacementNamed(
//                     context,
//                   '/login'
//                   );
//                 }
//               },
//               backgroundColor: MyColours.blue,
//               child: Icon(
//                 Icons.arrow_forward,
//                 color: MyColours.white,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
