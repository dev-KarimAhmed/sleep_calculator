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
    emit(BedTime());
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
        return '${hoursOnly + 12}:$minuteAp Am';
      }
      return '$hoursOnly:$minuteAp Am';
    } else {
      emit(BedTimeNow());
      return '${hoursOnly - 12}:$minuteAp Pm';
    }
  }
}
 
//${hour + Duration(hours: 1, minutes: minutes + 45)}
/***
 * 
 * if (numOfCycles == 1) {
      minute += 105;
      if (minute > 59) {
        minute -= 105;
        if (minute > 14) {
          minute -= 60;
          hour += 1;
        }
        if (hour + 2 > 11) {
          hour = 0;
          if (amOPm == 0) {
            return '${hour + 2}:${minute += 45} Am';
          } else {
            return '${hour + 2}:${minute += 45} Pm';
          }
        } else {
          return amOPm == 0
              ? '${hour + 2}:${minute += 45} Am'
              : '${hour + 2}:${minute += 45} Pm';
        }
      } else {
        return '';
      }
    } 
 */

/**
 *   String timeStyle() {
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

  String formatDate(String timeString) {
    String pattern = 'h:mm a';

    DateFormat format = DateFormat(pattern);

    DateTime dateTime = format.parse(timeString);
    return DateFormat.jm()
        .format(dateTime); // This will print the converted DateTime object
  }

  List<Duration> convertToInt() {
    int hour;
    int minute;
    if ((formatDate(timeStyle()).substring(0, 2)).contains(':')) {
      hour = int.parse(formatDate(timeStyle()).substring(0, 1));
      hour = int.parse(formatDate(timeStyle()).substring(0, 1));
    } else {
      hour = int.parse(formatDate(timeStyle()).substring(0, 2));
    }

    if (hour > 9) {
      minute = int.parse(formatDate(timeStyle()).substring(3, 5));
    } else {
      minute = int.parse(formatDate(timeStyle()).substring(2, 4));
    }
    return [Duration(hours: hour), Duration(minutes: minute)];
  }

 */