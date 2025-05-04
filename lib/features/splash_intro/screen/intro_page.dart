import 'package:doctor_booking1/features/auth/presentation/screen/login_page.dart';
import 'package:flutter/material.dart';


class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Expanded(
          child: ElevatedButton(
            style: ButtonStyle( ),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginPage(),
                  ),
                );
              },
              child: Text(
                'click',
                style: TextStyle(
                  fontFamily: '',
                ),
              )),
        ),
      ),
    );
  }
}
