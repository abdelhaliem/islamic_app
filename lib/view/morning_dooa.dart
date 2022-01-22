import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamic/bloc/cubit/islami_cubit.dart';
import 'package:islamic/bloc/stats/islami_stats.dart';
import 'package:islamic/widget/get_list_data.dart';
import 'package:islamic/widget/myappbar.dart';

class MorningDooa extends StatelessWidget {
  const MorningDooa({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: myAppBar(
            context: context,
            title: "الادعية المستحبة في الصباح"),
        body: BlocConsumer<IclamicCubit,IslamicState>(
          listener: (context,state){},
          builder: (context,state) {
            IclamicCubit cubit = IclamicCubit.get(context);
            return GetListDataMorning(
              data: cubit.morningDooaData,
            );
          },
        ),
      ),
    );
  }
}
