import 'package:doctor_booking1/constant/my_colours.dart';
import 'package:doctor_booking1/core/responsive.dart';
import 'package:doctor_booking1/features/auth/presentation/screens/profile_page.dart';
import 'package:doctor_booking1/features/booking/presentation/blocs/departments/departments_bloc.dart';
import 'package:doctor_booking1/features/booking/presentation/screens/booking_page.dart';
import 'package:doctor_booking1/features/home/presentation/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  ValueNotifier<int> selectedIndex = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: selectedIndex,
      builder: (context, value, _) {
        return Scaffold(
          body: IndexedStack(
            index: value,
            children: [
              HomePage(),
              BlocProvider(
                create: (context) =>  DepartmentsBloc()..add(GetAllDepartmentsBooking()),
                child: BookingPage(),
              ),
              ProfilePage(),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: value,
            onTap: (index) => selectedIndex.value = index,
            selectedItemColor: MyColours.blue,
            unselectedItemColor: MyColours.grey,
            selectedFontSize: context.screenWidth * 0.035,
            unselectedFontSize: context.screenWidth * 0.032,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.calendar_today), label: 'Bookings'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: 'Profile'),
            ],
          ),
        );
      },
    );
  }
}
