import 'dart:io';
import 'package:doctor_booking1/constant/my_colours.dart';
import 'package:doctor_booking1/constant/my_images.dart';
import 'package:doctor_booking1/constant/my_strings.dart';
import 'package:doctor_booking1/core/responsive.dart';
import 'package:doctor_booking1/core/token_manger.dart';
import 'package:doctor_booking1/features/home/presentation/widgets/costum_list_tile.dart';
import 'package:doctor_booking1/features/wallet/presentation/manager/wallet_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../generated/assets.dart';
import '../../../auth/presentation/bloc/auth_bloc.dart';
import '../../../pataint/presentation/manager/patiant_bloc.dart';
class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
@override
  void initState() {
  context.read<PatiantBloc>().add(GetProfilePataintEvent());

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(MyStrings.profile),
      ),
      body: BlocBuilder<PatiantBloc, PatiantState>(
        builder: (context, state) {
          if(state.status==Status.loading ){
            return CircularProgressIndicator();
          }
          else if (state.status == Status.success  && state.profileResponse!.doc[0]!=null){

          return Column(
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
                        foregroundImage:  FileImage(
                         File(state.profileResponse!.doc[0].photo,

                        ),
                      )
                      ),),
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
                height: context.screenHeight*0.01,
              ),
              Text(
                state.profileResponse!.doc[0].firstName + state.profileResponse!.doc[0].lastName,
              ),
              SizedBox(
                height: context.screenHeight*0.03,
              ),
              CostumListTile(
                title: MyStrings.yourProfile, iconLeading: Icons.person, onTap: () {
                Navigator.pushNamed(context, '/patient_profile_screen');
              },),
              CostumListTile(
                title: MyStrings.medicalHistory,
                iconLeading: Icons.person,
                onTap: () {
                  Navigator.pushNamed(context, '/medical');
                },
              ),
              CostumListTile(
                title: MyStrings.wallet, iconLeading: Icons.settings, onTap: () {
                context.read<WalletBloc>().add(GetWalletEvent());
                Navigator.pushNamed(context, '/wallet_screen');
              },),
              CostumListTile(
                title: MyStrings.logout,
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
                        title: Text(MyStrings.logout),
                        content: Text('Are you sure  you want to Log out ?'),
                        actionsAlignment: MainAxisAlignment.center,
                        actions: [
                          TextButton(
                              onPressed: () async {
                                await TokenManager1.deleteToken();

                                Navigator.pushNamedAndRemoveUntil(
                                  context,
                                  '/',
                                      (Route<dynamic> route) => false,
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
          );}
          else if (state.status== Status.failed){
            return Center(child:Text(state.massage!));
          }
          else{
            return    CostumListTile(
              title: MyStrings.logout,
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
                      title: Text(MyStrings.logout),
                      content: Text('Are you sure  you want to Log out ?'),
                      actionsAlignment: MainAxisAlignment.center,
                      actions: [
                        TextButton(
                            onPressed: () async {
                              await TokenManager1.deleteToken();

                              Navigator.pushNamedAndRemoveUntil(
                                context,
                                '/',
                                    (Route<dynamic> route) => false,
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
            );
          }
        },
      ),
    );
  }
}
