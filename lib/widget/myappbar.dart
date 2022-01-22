import 'package:flutter/material.dart';
import 'package:islamic/style/color.dart';



dynamic myAppBar ({required String title ,bool back = true , required BuildContext context})  {
  return  AppBar(
    leading:
    back == true ? Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            color: Colors.amber,
            blurRadius: 3,
          ),
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Center(
        child: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_outlined,
            color: AppColors.mainColor,
          ),
        ),
      ),
    ): const SizedBox(),
    // flexibleSpace: Container(
    //   decoration: const BoxDecoration(
    //       image: DecorationImage(
    //         image: AssetImage(
    //           'assets/images/isla.jpg',
    //         ),
    //         fit: BoxFit.cover,
    //       )),
    // ),
    title: Text(title),
    centerTitle: true,
  );
}
