import 'package:flutter/material.dart';
import 'package:islamic/style/color.dart';
import 'package:islamic/widget/component.dart';

class HomeContainer extends StatelessWidget {

  final String text ;
  final String title ;

  const HomeContainer(this.text, this.title, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4),
      width: w(context)/3-15,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.mainColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 3,
            child: Text(
              text,
              style: const TextStyle(
                  color: Colors.white, fontSize: 30),
            ),
          ),
           Expanded(
             flex: 2,
             child: Text(
             title,
              style: const TextStyle(
                  color: Colors.white,),
          ),
           ),
          const SizedBox(
            height: 5,
          )
        ],
      ),
    );
  }
}
