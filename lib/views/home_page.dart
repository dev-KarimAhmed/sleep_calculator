import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../components/custom_button.dart';
import '../components/custom_list_scroll.dart';
import '../constants/colors.dart';
import '../cubit/clac_time_cubit.dart';
import 'bedtime_now_view.dart';
import 'bedtime_view.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  static const String id = 'HomePage';
  final List<String> hours = [
    '01',
    '02',
    '03',
    '04',
    '05',
    '06',
    '07',
    '08',
    '09',
    '10',
    '11',
    '12'
  ];
  final List<String> minutes = [
    '00',
    '01',
    '02',
    '03',
    '04',
    '05',
    '06',
    '07',
    '08',
    '09',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20',
    '21',
    '22',
    '23',
    '24',
    '25',
    '26',
    '27',
    '28',
    '29',
    '30',
    '31',
    '32',
    '33',
    '34',
    '35',
    '36',
    '37',
    '38',
    '39',
    '40',
    '41',
    '42',
    '43',
    '44',
    '45',
    '46',
    '47',
    '48',
    '49',
    '50',
    '51',
    '52',
    '53',
    '54',
    '55',
    '56',
    '57',
    '58',
    '59',
  ];
  final List<String> amOrPmList = ['Am', 'Pm'];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ClacTimeCubit, ClacTimeState>(builder: (context, state) {
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
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SvgPicture.asset('assets/images/logo.svg'),
                  const Text(
                    'What Time do you want to sleep at?',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.3,
                    width: MediaQuery.of(context).size.width * 0.8,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(color: kSecondarycolor)),
                    child: Center(
                      child: SizedBox(
                        height: 75,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            const Divider(
                              color: Color(0xff191F43),
                            ),
                            Flexible(
                              child: Row(
                                children: [
                                  CustomListWheelScrollView(
                                    scrollController:
                                        BlocProvider.of<ClacTimeCubit>(context)
                                            .scrollControllerHours,
                                    list: hours,
                                    itemExtent: 20,
                                    magnification: 1.5,
                                    useMagnifier: true,
                                  ),
                                  CustomListWheelScrollView(
                                    scrollController:
                                        BlocProvider.of<ClacTimeCubit>(context)
                                            .scrollControllerMin,
                                    list: minutes,
                                    itemExtent: 20,
                                    magnification: 1.5,
                                    useMagnifier: true,
                                  ),
                                  CustomListWheelScrollView(
                                    list: amOrPmList,
                                    itemExtent: 17,
                                    magnification: 1.5,
                                    useMagnifier: true,
                                    scrollController:
                                        BlocProvider.of<ClacTimeCubit>(context)
                                            .scrollControllera,
                                  ),
                                ],
                              ),
                            ),
                            const Divider(
                              color: Color(0xff191F43),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 70,
                  ),
                  CustomButton(
                    onTap: () {
                      Navigator.pushNamed(context, BedtimeView.id);
                    },
                    data: 'Calculate BedTime',
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    'if you want to go bed now...',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  CustomButton(
                    onTap: () {
                     
                      Navigator.pushNamed(context, BedtimeViewNow.id);
                    },
                    data: 'Calculate wake-up time',
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
