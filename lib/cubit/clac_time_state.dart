part of 'clac_time_cubit.dart';

@immutable
abstract class ClacTimeState {}

class ClacTimeInitial extends ClacTimeState {}
class BedTime extends ClacTimeState {}
class BedTimeNow extends ClacTimeState {}

