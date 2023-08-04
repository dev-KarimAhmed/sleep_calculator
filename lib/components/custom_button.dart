import 'package:flutter/material.dart';

import '../constants/colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.onTap, required this.data,
  });
  final void Function()? onTap;
  final String data;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.7,
        height: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8), color: kSecondarycolor),
        child: Center(child: Text(data)),
      ),
    );
  }
}
