import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sleep_calculator/views/bedtime_view.dart';
import 'package:sleep_calculator/views/home_page.dart';

import 'cubit/clac_time_cubit.dart';

void main() {
  runApp(const SleepCalculator());
}

class SleepCalculator extends StatelessWidget {
  const SleepCalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => CalcTimeCubit(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Sleep Calculator',
          routes: {
            HomePage.id: (context) => HomePage(),
            BedtimeView.id: (context) => const BedtimeView(),
          },
          initialRoute: HomePage.id,
        ));
  }
}
