// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

part 'clac_time_state.dart';

class CalcTimeCubit extends Cubit<CalcTimeState> {
  CalcTimeCubit() : super(ClacTimeInitial());
  FixedExtentScrollController scrollControllerHours =
      FixedExtentScrollController();
  FixedExtentScrollController scrollControllerMin =
      FixedExtentScrollController();
  FixedExtentScrollController scrollControllera = FixedExtentScrollController();

  bool isBedTime = true;
  String timeStyle() {
    int hour = scrollControllerHours.selectedItem;
    int minute = scrollControllerMin.selectedItem;
    int amOrPm = scrollControllera.selectedItem;
    if (minute < 10) {
      if (amOrPm == 0) {
        return '${hour + 1}:0$minute AM';
      } else {
        return '${hour + 1}:0$minute PM';
      }
    } else if (minute > 10 || minute == 10) {
      if (amOrPm == 0) {
        return '${hour + 1}:$minute AM';
      } else {
        return '${hour + 1}:$minute PM';
      }
    } else {
      return '';
    }
  }

  String bedTime(int hourAdd, int minuteAdd) {
    Duration hour = Duration(hours: scrollControllerHours.selectedItem + 1);
    int minutes = scrollControllerMin.selectedItem;
    int amOrPm = scrollControllera.selectedItem;
    //converting time
    DateFormat df = DateFormat('hh:mm:ss.MMMMMM');
    Duration wakeUpTime =
        hour + Duration(hours: hourAdd, minutes: minutes + minuteAdd);
    DateTime dt = df.parse('$wakeUpTime');
    String stringTime = DateFormat.Hm().format(dt);
    //---------------------------------------------------
    bool am = amOrPm == 0;
    int hourAP = int.parse(stringTime.substring(0, 2));
    int minuteAp = int.parse(stringTime.substring(3, 5));
    int hoursOnly = int.parse(stringTime.substring(0, 2));

    //to switch between am and pm

    if (hourAP <= 12) {
      if (hourAP == 0) {
        return am
            ? '${hoursOnly + 12}:$minuteAp Pm'
            : '${hoursOnly + 12}:$minuteAp Am';
      } else {
        return am ? '$stringTime Am' : '$stringTime Pm';
      }
    } else if (hourAP >= 12) {
      return am
          ? '${hoursOnly - 12}:$minuteAp Pm'
          : '${hoursOnly - 12}:$minuteAp Am';
    }
    return '';
  }

  String bedTimeNow(int hourAdd, int minuteAdd) {
    Duration hour = Duration(hours: DateTime.now().hour);
    int minutes = DateTime.now().minute;
    //converting time
    DateFormat df = DateFormat('hh:mm:ss.MMMMMM');
    Duration wakeUpTime =
        hour + Duration(hours: hourAdd, minutes: minutes + minuteAdd);
    DateTime dt = df.parse('$wakeUpTime');
    String stringTime = DateFormat.Hm().format(dt);
    //---------------------------------------------------
    int hourAP = int.parse(stringTime.substring(0, 2));
    int minuteAp = int.parse(stringTime.substring(3, 5));
    int hoursOnly = int.parse(stringTime.substring(0, 2));

    //to switch between am and pm
    if (hourAP < 12) {
      if (hourAP == 0) {
        return minuteAp < 10
            ? '${hoursOnly + 12}:0$minuteAp Am'
            : '${hoursOnly + 12}:$minuteAp Am';
      }
      if (hourAP == 12) {
        return minuteAp < 10
            ? '$hoursOnly:0$minuteAp Pm'
            : '$hoursOnly:$minuteAp Pm';
      } else {
        return minuteAp < 10
            ? '$hoursOnly:0$minuteAp Am'
            : '$hoursOnly:$minuteAp Am';
      }
    } else {
      if (hourAP == 12) {
        return minuteAp < 10
            ? '$hoursOnly:0$minuteAp Pm'
            : '$hoursOnly:$minuteAp Pm';
      } else {
        return minuteAp < 10
            ? '${hoursOnly - 12}:0$minuteAp Pm'
            : '${hoursOnly - 12}:$minuteAp Pm';
      }
    }
  }
}
