import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamic/bloc/cubit/islami_cubit.dart';
import 'package:islamic/style/color.dart';
import 'package:share_plus/share_plus.dart';

class GetListDataMorning extends StatelessWidget {

  final data ;
 const GetListDataMorning({Key? key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    IclamicCubit cubit = IclamicCubit.get(context);
    return  ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: data.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            HapticFeedback.lightImpact();
            cubit.decrement(index: index, data: data);
            cubit.remove(index: index, context: context, data: data);
            // data.decrement(index: index,);
            // data.remove(index: index);
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              color: AppColors.mainColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              elevation: 10,
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(15),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30),
                        topLeft: Radius.circular(30),
                      ),
                      color: AppColors.mainColor,
                    ),
                    child: Text(
                      data[index].data,
                      style: const TextStyle(
                        color: Colors.amber,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  const Divider(
                    color: Colors.white,
                    height: 1,
                  ),
                  Container(
                    height: 60,
                    // padding: const EdgeInsets.all(15),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(30),
                        bottomLeft: Radius.circular(30),
                      ),
                      color: AppColors.mainColor,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 25,
                          child: TextButton(
                            onPressed: () {
                              HapticFeedback.heavyImpact();
                              cubit.decrement(index: index, data: data);
                              cubit.remove(index: index, context: context, data: data);
                              // data.decrement(index: index);
                              // data.remove(index: index);
                            },
                            child: Text(
                              "عدد المرات : ${data[index].counter}",
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20),
                            ),
                          ),
                        ),
                        Expanded(
                            flex: 1,
                            child: Container(
                              width: 2,
                              height: 50,
                              // padding: const EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  topRight: Radius.circular(30),
                                  bottomRight: Radius.circular(30),
                                  bottomLeft: Radius.circular(30),
                                ),
                                color: Colors.white.withOpacity(0.1),
                              ),
                            )),
                        Expanded(
                          flex: 25,
                          child: IconButton(
                            onPressed: () async {
                              await Share.share(
                                "الدعاء : ${data[index].data}\n عدد المرات : ${data[index].counter} ",
                              );

                            },
                            icon: const Icon(
                              Icons.share,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
