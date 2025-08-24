import 'package:flutter/material.dart';

class CostumListTile extends StatelessWidget {
  final String title;
  final IconData iconLeading;
 final   void Function()? onTap ;
  const CostumListTile(
      {super.key,this.onTap, required this.title, required this.iconLeading});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(

          onTap: onTap,
          title: Text(
            title,
          ),
          leading: Icon(iconLeading),
          trailing: Icon(Icons.arrow_forward_ios),
        ),
        Divider(
          indent: 20,
          endIndent: 35,
        ),
      ],
    );
  }
}
