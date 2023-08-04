// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';


class CustomListWheelScrollView extends StatefulWidget {
  CustomListWheelScrollView({
    super.key, 
    required this.list,
    this.useMagnifier = false,
    this.magnification = 1,
    this.onSelectedItemChanged,
    required this.itemExtent,
    required this.scrollController,
  });
  final List<String> list;
  bool useMagnifier;
  double magnification;
  double itemExtent;
  void Function(int)? onSelectedItemChanged;
  FixedExtentScrollController scrollController;

  @override
  State<CustomListWheelScrollView> createState() => _CustomListWheelScrollViewState();
}

class _CustomListWheelScrollViewState extends State<CustomListWheelScrollView> {
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ListWheelScrollView(
        useMagnifier: widget.useMagnifier,
        magnification: widget.magnification,
        onSelectedItemChanged: widget.onSelectedItemChanged,
          controller: widget.scrollController,
        itemExtent: widget.itemExtent,
        children: widget.list.map((e) {
          return Text(e, style: const TextStyle(color: Colors.white));
        }).toList(),
      ),
    );
  }
}
