import 'package:doctor_booking1/constant/my_colours.dart';
import 'package:doctor_booking1/constant/my_strings.dart';
import 'package:flutter/material.dart';

import '../../../core/token_manger.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _logoAnimation;
  late Animation<Offset> _textAnimation;
  late Animation<double> _opacityAnimation;
  void checkLoginStatus() async {
    final token = await TokenManager1.getToken();

    if (token != null) {
      // المستخدم مسجّل دخول => انتقل للصفحة الرئيسية
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      // لا يوجد توكن => انتقل إلى صفحة تسجيل الدخول
      Navigator.pushReplacementNamed(context, '/login');
    }
  }
  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(
        seconds: 4,
      ),
      vsync: this,
    );

    _logoAnimation = Tween<Offset>(
      begin: const Offset(0, 0),
      end: const Offset(-0.25, 0),
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.5, curve: Curves.easeOut),
      ),
    );

    _textAnimation = Tween<Offset>(
      begin: const Offset(1.5, 0),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.2, 0.8, curve: Curves.easeOut),
      ),
    );
    _opacityAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.5),
      ),
    );

    _controller.forward().whenComplete(() async {
      await Future.delayed(
        const Duration(seconds: 1),
      );
      if (mounted) {
       checkLoginStatus();
      }
    });

  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColours.blue ,
      body: Center(
        child: FadeTransition(
          opacity: _opacityAnimation,
          child: FittedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 28.0),
                  child: SlideTransition(
                    position: _logoAnimation,
                    child: Icon(
                      kIcon,
                      size: MediaQuery.of(context).size.height * 0.09,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.02,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 18.0),
                  child: SlideTransition(
                    position: _textAnimation,
                    child: Text(
                      MyStrings.splash,
                      style: TextStyle(
                        color: MyColours.white,
                        fontSize: MediaQuery.of(context).size.width * 0.08,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}