import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamic/layout/home_layout.dart';
import 'package:islamic/layout/shop_layout.dart';
import 'package:islamic/style/theme.dart';
import 'bloc/cubit/islami_cubit.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => IclamicCubit(),
      child: MaterialApp(
          // locale:,
          debugShowCheckedModeBanner: false,
          title: 'اسلامي',
          theme: theme ,
          home: const HomeLayout(),
      ),
    );
  }
}
