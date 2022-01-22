import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamic/bloc/cubit/islami_cubit.dart';
import 'package:islamic/bloc/stats/islami_stats.dart';
import 'package:islamic/widget/get_list_data.dart';
import 'package:islamic/widget/myappbar.dart';
import 'package:lottie/lottie.dart';

class Evening extends StatelessWidget {
  const Evening({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: myAppBar(
          title: "اذكار المساء",
          context: context,
        ),
        body: BlocConsumer<IclamicCubit, IslamicState>(
          listener: (context, state) {},
          builder: (context, state) {
            IclamicCubit cubit = IclamicCubit.get(context);
            return cubit.eveningData.length == 0
                ? Lottie.asset("assets/json/alldone.json")
                : GetListDataMorning(
                    data: cubit.eveningData,
                  );
          },
        ),
      ),
    );
  }
}
