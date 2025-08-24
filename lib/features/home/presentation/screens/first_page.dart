import 'package:doctor_booking1/constant/my_colours.dart';
import 'package:doctor_booking1/core/app_validator.dart';
import 'package:doctor_booking1/core/responsive.dart';
import 'package:doctor_booking1/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:doctor_booking1/features/booking/presentation/blocs/departments/departments_bloc.dart';
import 'package:doctor_booking1/features/booking/presentation/screens/booking_page.dart';
import 'package:doctor_booking1/features/home/presentation/screens/home_page.dart';
import 'package:doctor_booking1/features/home/presentation/screens/profile_page.dart';
import 'package:doctor_booking1/features/review/data/models/review_request_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../review/presentation/manager/review_bloc.dart'; // ⭐ لإظهار النجوم

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  ValueNotifier<int> selectedIndex = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          bool? result = await showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) {
              return BlocProvider.value(
                value: context.read<ReviewBloc>(), // استخدام نفس الـ Bloc الموجود
                child:  RatingDialog(),
              );
            },
          );
          return result ?? false;
        },
      child: ValueListenableBuilder(
        valueListenable: selectedIndex,
        builder: (context, value, _) {
          return Scaffold(
            body: IndexedStack(
              index: value,
              children: [
                HomePage(),
                BlocProvider(
                  create: (context) =>
                  DepartmentsBloc()..add(GetAllDepartmentsBooking()),
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
                BottomNavigationBarItem(
                    icon: Icon(Icons.home), label: 'Home'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.calendar_today), label: 'Bookings'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person), label: 'Profile'),
              ],
            ),
          );
        },
      ),
    );
  }
}

class RatingDialog extends StatefulWidget {
  const RatingDialog({super.key});

  @override
  State<RatingDialog> createState() => _RatingDialogState();
}

class _RatingDialogState extends State<RatingDialog> {
  double _rating = 0;
  final TextEditingController _commentController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocListener<ReviewBloc, ReviewState>(
      listener: (context, state) async {
        if (state.reviewStatus == Status.success) {
          ScaffoldMessenger.of(context).showSnackBar(
             SnackBar(content: Text("تم التقييم بنجاح!")),
          );
          if (mounted) Navigator.pop(context, true);
        } else if (state.reviewStatus == Status.failed) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("حدث خطأ: ${state.massage}")),
          );
        }
      },
      child: AlertDialog(
        title: const Text("Review  App "),
        content: Form(
          key :_formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              RatingBar.builder(
                initialRating: 0,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: false,
                itemCount: 5,
                itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  setState(() {
                    _rating = rating;
                  });
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) => AppValidator.required(value),
                maxLines: 3,
                controller: _commentController,
                decoration: const InputDecoration(hintText: "write comment"),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context, true); // تخطي والخروج
            },
            child: const Text("Close App"),
          ),
          ElevatedButton(
            onPressed: () {
              // إرسال التقييم للـ API
         if(_formKey.currentState!.validate()){
           context.read<ReviewBloc>().add(
             AddReviewEvent(
               reviewRequestModel: ReviewRequestModel(
                 message: _commentController.text,
                 rate: _rating,
               ),
             ),
           );
           if (mounted) Navigator.pop(context, true);
         }
              // لا تغلق الـ dialog هنا، الـ BlocListener رح يغلقه بعد النجاح
            },
            child: const Text("Send"),
          ),
        ],
      ),
    );
  }
}
