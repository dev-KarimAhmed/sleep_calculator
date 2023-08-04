import 'package:flutter/material.dart';

import '../constants/colors.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({
    super.key,
    this.width,
    required this.data,
    this.isSuggested = false,
    this.fontSize = 20, required this.numberOfCycles,
  });

  final double? width;
  final String data;
  final bool isSuggested;
  final double? fontSize;
  final String numberOfCycles;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '$numberOfCycles : ',
          style: const TextStyle(color: Colors.white),
        ),
        GestureDetector(
          onTap: () {},
          child: Container(
            width: width,
            decoration: BoxDecoration(
                color: kContainerColor,
                borderRadius: BorderRadius.circular(16)),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    data,
                    style: TextStyle(color: Colors.white, fontSize: fontSize),
                  ),
                  isSuggested
                      ? const Text(
                          'SUGGESTED',
                          style:
                              TextStyle(color: kSecondarycolor, fontSize: 12),
                        )
                      : Container(),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
