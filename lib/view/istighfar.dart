import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamic/bloc/cubit/islami_cubit.dart';
import 'package:islamic/bloc/stats/islami_stats.dart';
import 'package:islamic/style/color.dart';
import 'package:islamic/widget/myappbar.dart';

class Istigfar extends StatelessWidget {
  const Istigfar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: myAppBar(
            context: context,
            title: "اسْتَغْفِرُوا رَبَّكُمْ إِنَّهُ كَانَ غَفَّارًا"),
        body: Container(
          padding: const EdgeInsets.all(10),
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/isla.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: BlocConsumer<IclamicCubit, IslamicState>(
            listener: (context, state) {},
            builder: (context, state) {
              IclamicCubit cubit = IclamicCubit.get(context);
              return Column(
                children: [
                  const SizedBox(
                    height: 250,
                  ),
                  Center(
                    child: Text(
                      cubit.nameIs,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 35,
                        color: Colors.white,
                        shadows: [
                          Shadow(
                            offset: const Offset(2, 2),
                            color: Colors.yellow.shade600,
                            blurRadius: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(30)),
                    ),
                    child: const Text(
                      'الاستغفار',
                      style: TextStyle(fontSize: 30, color: AppColors.mainColor),
                    ),
                  ),
                  Text(
                    cubit.countIs.toString(),
                    style: TextStyle(
                      fontSize: 40,
                      color: Colors.white,
                      shadows: [
                        Shadow(
                            offset: const Offset(2, 2),
                            color: Colors.yellow.shade600,
                            blurRadius: 10)
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                     cubit.increment();
                      HapticFeedback.lightImpact();
                    },
                    style: ElevatedButton.styleFrom(
                        elevation: 10,
                        padding: const EdgeInsets.all(0),
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                            color: Colors.white,
                            width: 5,
                          ),
                          borderRadius: BorderRadius.circular(100),
                        )),
                    child: Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: AppColors.mainColor),
                      child: const Center(
                        child: Text(
                          'اضغط',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

}

// class Istigfar extends StatelessWidget {
//   Istigfar({Key? key}) : super(key: key);
//   MisbhaController controller = Get.put(MisbhaController());
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: myAppBar(title: "اسْتَغْفِرُوا رَبَّكُمْ إِنَّهُ كَانَ غَفَّارًا"),
//       body: Container(
//         padding:const EdgeInsets.all(10),
//         width: double.infinity,
//         height: double.infinity,
//         decoration: const BoxDecoration(
//           image: DecorationImage(
//             image: AssetImage('assets/images/isla.jpg'),
//             fit: BoxFit.cover,
//           ),
//         ),
//         child: GetBuilder<MisbhaController>(
//           init: MisbhaController(),
//           builder: (controller){
//             return  Column(
//               children: [
//                 const SizedBox(
//                   height: 250,
//                 ),
//                 Center(
//                   child: Text(
//                     controller.nameIs,
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                       fontSize: 35,
//                       color: Colors.white,
//                       shadows: [
//                         Shadow(
//                           offset:const Offset(2, 2),
//                           color: Colors.yellow.shade600,
//                           blurRadius: 10,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 Container(
//                   margin: const EdgeInsets.all(10),
//                   padding: const EdgeInsets.symmetric(horizontal: 20),
//                   decoration: const BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.only(
//                         topLeft: Radius.circular(30),
//                         topRight: Radius.circular(10),
//                         bottomLeft: Radius.circular(10),
//                         bottomRight: Radius.circular(30)),
//                   ),
//                   child: const Text(
//                     'الاستغفار',
//                     style: TextStyle(fontSize: 30, color: AppColors.mainColor),
//                   ),
//                 ),
//                 Text(
//                   controller.countIs.toString(),
//                   style: TextStyle(
//                     fontSize: 40,
//                     color: Colors.white,
//                     shadows: [
//                       Shadow(
//                           offset:const Offset(2, 2),
//                           color: Colors.yellow.shade600,
//                           blurRadius: 10)
//                     ],
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 ElevatedButton(
//                   onPressed: () {
//                     controller.increment();
//                     HapticFeedback.lightImpact();
//                   },
//                   style: ElevatedButton.styleFrom(
//                       elevation: 10,
//                       padding: const EdgeInsets.all(0),
//                       shape: RoundedRectangleBorder(
//                         side: const BorderSide(
//                           color: Colors.white,
//                           width: 5,
//                         ),
//                         borderRadius: BorderRadius.circular(100),
//                       )),
//                   child: Container(
//                     width: 150,
//                     height: 150,
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(100),
//                         color: AppColors.mainColor
//                     ),
//                     child: const Center(
//                       child: Text(
//                         'اضغط',
//                         style: TextStyle(fontSize: 20),
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 10,
//                 ),
//               ],
//             );
//           },
//
//         ),
//       ),
//     );
//   }
// }
