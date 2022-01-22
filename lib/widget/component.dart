import 'package:flutter/material.dart';



 double w (BuildContext context) => MediaQuery
      .of(context)
      .size
      .width;
double h (BuildContext context) => MediaQuery
    .of(context)
    .size
    .height;

void navigateTo({required BuildContext context, required Widget widget}){
 Navigator.of(context).push(MaterialPageRoute(builder: (context)=>widget ));
}