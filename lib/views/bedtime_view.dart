import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../components/custom_button.dart';
import '../components/custom_container.dart';
import '../constants/colors.dart';
import '../cubit/clac_time_cubit.dart';

class BedtimeView extends StatelessWidget {
  const BedtimeView({super.key});
  static String id = 'BedtimeView';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalcTimeCubit, CalcTimeState>(
      builder: (context, state) {
        return Scaffold(
          appBar: null,
          body: SafeArea(
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                    kPrimaryColorOne,
                    kPrimaryColorTwo,
                    kPrimaryColorThree,
                    kPrimaryColorFour,
                  ])),
              child: BlocProvider.of<CalcTimeCubit>(context).isBedTime
                  ? Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SvgPicture.asset('assets/images/logo.svg'),
                          const Text(
                            'Bedtime',
                            style:
                                TextStyle(color: kSecondarycolor, fontSize: 28),
                          ),
                          const Text(
                            'The average human takes 15 minutes to fall asleep.',
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            'To Sleep at ${BlocProvider.of<CalcTimeCubit>(context).timeStyle()},\n you will wake up refreshed at one of the following times:',
                            style: const TextStyle(
                                color: Colors.white, fontSize: 22),
                          ),
                          CustomContainer(
                            numberOfCycles: 'One Cycle',
                            data: BlocProvider.of<CalcTimeCubit>(context)
                                .bedTime(1, 45),
                          ),
                          CustomContainer(
                            numberOfCycles: 'Two Cycles',
                            data:
                                BlocProvider.of<CalcTimeCubit>(context).bedTime(
                              3,
                              1,
                            ),
                          ),
                          CustomContainer(
                            numberOfCycles: 'Three Cycles',
                            data: BlocProvider.of<CalcTimeCubit>(context)
                                .bedTime(4, 45),
                          ),
                          CustomContainer(
                            numberOfCycles: 'Four Cycles',
                            data: BlocProvider.of<CalcTimeCubit>(context)
                                .bedTime(6, 15),
                          ),
                          CustomContainer(
                            numberOfCycles: 'Five Cycles',
                            data: BlocProvider.of<CalcTimeCubit>(context)
                                .bedTime(7, 45),
                            width: MediaQuery.of(context).size.width * 0.5,
                            isSuggested: true,
                          ),
                          CustomContainer(
                            numberOfCycles: 'Six Cycles',
                            data: BlocProvider.of<CalcTimeCubit>(context)
                                .bedTime(9, 15),
                          ),
                          const Text(
                            'If you wake up at one of these times, you’ll rise in between 90-minute sleep cycles.',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                          const Text(
                            'A good night’s sleep consists of 5-6 complete sleep cycles.',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                          CustomButton(
                            data: 'Go Back',
                            onTap: () {
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SvgPicture.asset('assets/images/logo.svg'),
                          const Text(
                            'Bedtime',
                            style:
                                TextStyle(color: kSecondarycolor, fontSize: 28),
                          ),
                          const Text(
                            'The average human takes 15 minutes to fall asleep.',
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            'if you slept now\n you will wake up refreshed at one of the following times:',
                            style: const TextStyle(
                                color: Colors.white, fontSize: 22),
                          ),
                          CustomContainer(
                            numberOfCycles: 'One Cycle',
                            data: BlocProvider.of<CalcTimeCubit>(context)
                                .bedTimeNow(1, 45),
                          ),
                          CustomContainer(
                            numberOfCycles: 'Two Cycles',
                            data: BlocProvider.of<CalcTimeCubit>(context)
                                .bedTimeNow(
                              3,
                              1,
                            ),
                          ),
                          CustomContainer(
                            numberOfCycles: 'Three Cycles',
                            data: BlocProvider.of<CalcTimeCubit>(context)
                                .bedTimeNow(4, 45),
                          ),
                          CustomContainer(
                            numberOfCycles: 'Four Cycles',
                            data: BlocProvider.of<CalcTimeCubit>(context)
                                .bedTimeNow(6, 15),
                          ),
                          CustomContainer(
                            numberOfCycles: 'Five Cycles',
                            data: BlocProvider.of<CalcTimeCubit>(context)
                                .bedTimeNow(7, 45),
                            width: MediaQuery.of(context).size.width * 0.45,
                            isSuggested: true,
                          ),
                          CustomContainer(
                            numberOfCycles: 'Six Cycles',
                            data: BlocProvider.of<CalcTimeCubit>(context)
                                .bedTimeNow(9, 15),
                          ),
                          const Text(
                            'If you wake up at one of these times, you’ll rise in between 90-minute sleep cycles.',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                          const Text(
                            'A good night’s sleep consists of 5-6 complete sleep cycles.',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                          CustomButton(
                            data: 'Go Back',
                            onTap: () {
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      ),
                    ),
            ),
          ),
        );
      },
    );
  }
}
