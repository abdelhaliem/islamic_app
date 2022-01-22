import 'package:flutter/material.dart';
import 'package:islamic/style/color.dart';
import 'package:islamic/view/Qiblah.dart';
import 'package:islamic/view/evening_dooa.dart';
import 'package:islamic/view/morning_dooa.dart';
import 'component.dart';
import 'list_drawer.dart';


class MyDrawer extends StatelessWidget {
   const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              boxShadow: const [BoxShadow(
                color: Colors.white,
                blurRadius: 10,
              )]
            ),
            child: const CircleAvatar(
              radius: 60,
              backgroundColor: AppColors.mainColor,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Image(
                  image: AssetImage('assets/images/icon.png'),
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Divider(),
          ListDrawer(
            title: "الصفحة الرئسية",
            onTap: () {
              Navigator.pop(context);
            },
          ),
          const Divider(),
          ListDrawer(
            title: "الادعية المستحبة في الصباح",
            onTap: () {
              navigateTo(widget: const MorningDooa(),context: context);
            },
          ),
          const Divider(),
          ListDrawer(
            title: "الأدعية المستحبة في المساء",
            onTap: () {
              navigateTo(context: context, widget:const EveningDooa());
            },
          ),

          const Divider(),
          ListDrawer(
            title: "عن التطبيق",
            onTap: () {
              navigateTo(context: context, widget: Qiblah());
            },
          )
        ],
      ),
    );
  }
}
