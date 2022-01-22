import 'package:flutter/material.dart';
import 'package:islamic/style/color.dart';

class ListDrawer extends StatelessWidget {
  final String title;
  final dynamic onTap ;

  const ListDrawer({Key? key, required this.title,this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
                boxShadow: const [
                  BoxShadow(
                    color: AppColors.mainColor,
                    blurRadius: 3,
                  )
                ]),
            child: ListTile(
              trailing: const Icon(
                Icons.arrow_forward_ios_rounded,
                color: AppColors.mainColor,
              ),
              title: Center(
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 15,
                    color: AppColors.mainColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
