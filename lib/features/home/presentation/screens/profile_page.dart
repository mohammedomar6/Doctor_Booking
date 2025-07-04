import 'package:doctor_booking1/constant/my_colours.dart';
import 'package:doctor_booking1/constant/my_images.dart';
import 'package:doctor_booking1/core/token_manger.dart';
import 'package:doctor_booking1/features/home/presentation/widgets/costum_list_tile.dart';
import 'package:doctor_booking1/features/wallet/presentation/manager/wallet_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../generated/assets.dart';
import '../../../pataint/presentation/manager/patiant_bloc.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Profile'),
      ),
      body: Column(
        children: [
          Center(
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: MyColours.blue),
                      borderRadius: BorderRadius.circular(120),
                      boxShadow: [
                        BoxShadow(
                          color: MyColours.grey.withAlpha(78),
                          offset: Offset(0, 5),
                        ),
                      ]),
                  child: CircleAvatar(
                    radius: 80,
                    foregroundImage: AssetImage(
                      MyImages.introImage1,
                    ),
                  ),
                ),
                Positioned(
                    bottom: 0,
                    right: 10,
                    child: IconButton(
                        style: ButtonStyle(
                            backgroundColor:
                                WidgetStatePropertyAll(MyColours.blue)),
                        onPressed: () {},
                        icon: Icon(color: MyColours.white, Icons.edit)))
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'Mohammed Omar',
          ),
          SizedBox(
            height: 50,
          ),
          CostumListTile(title: 'Your Profile', iconLeading: Icons.person,onTap: (){
             context.read<PatiantBloc>().add(GetProfilePataintEvent());
            Navigator.pushNamed(context, '/patient_profile_screen');
          },),
          CostumListTile(
            title: 'Medical History',
            iconLeading: Icons.person,
            onTap: () {
              Navigator.pushNamed(context, '/medical');
            },
          ),
          CostumListTile(title: 'Wallet', iconLeading: Icons.settings,onTap: (){
            context.read<WalletBloc>().add(GetWalletEvent());
            Navigator.pushNamed(context, '/wallet_screen');
          },),
          CostumListTile(
            title: 'Log Out',
            iconLeading: Icons.logout,
            onTap: () {
              showDialog(
                barrierDismissible: false,
                context: context,
                builder: (context) {
                  return AlertDialog(
                    icon: Image.asset(
                      Assets.imagesP1,
                      height: 200,
                      width: 200,
                    ),
                    title: Text('Log Out'),
                    content: Text('Are you sure  you want to Log out ?'),
                    actionsAlignment: MainAxisAlignment.center,
                    actions: [
                      TextButton(
                          onPressed: () async {
                            await TokenManager1.deleteToken();
                            Navigator.pushNamedAndRemoveUntil(
                              context,
                              '/',
                              (route) => false,
                            );
                          },
                          child: Text('Yes')),
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('No')),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
