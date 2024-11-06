import 'package:flutter/material.dart';

import '../../../utils/app_colors.dart';

class CommonButton extends StatelessWidget {
  const CommonButton({super.key, required this.onPressed, required this.text});

  final Function onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColor.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
        minimumSize: Size(
          MediaQuery.of(context).size.width * 0.25,
          48,
        ),
      ),
      onPressed: () => onPressed(),
      child: Text(
        text,
        style: const TextStyle(
          color: Color(0xff112A46),
          fontSize: 14,
        ),
      ),
    );
  }
}
