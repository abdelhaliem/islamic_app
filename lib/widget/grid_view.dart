import 'package:flutter/material.dart';
import 'package:islamic/style/color.dart';
import 'package:lottie/lottie.dart';

class GridViewContainer extends StatelessWidget {
  final String image ;
  final String title;

  const GridViewContainer({Key? key, required this.image, required this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {


    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Expanded(
        child: Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(40),
              boxShadow:  const [
                BoxShadow(
                  color: AppColors.mainColor,
                  blurRadius: 5,
                ),
              ]),
          child: Column(
            children: [
              Expanded(
                flex: 5,
                child: Lottie.asset(image),
              ),
               Expanded(
                flex: 2,
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      color: AppColors.mainColor, fontSize: 20),
                ),
              ),
              const SizedBox(
                height: 10,
              )
            ],
          ),
        ),
      ),
    );
  }

}
