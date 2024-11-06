import 'package:flutter/material.dart';

import '../../../utils/app_colors.dart';

class SmallIcon extends StatelessWidget {
  const SmallIcon({super.key, required this.onTap, required this.iconData});

  final Function onTap;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(),
      child: Container(
        height: 24,
        width: 24,
        decoration: BoxDecoration(
            color: AppColor.primaryColor,
            borderRadius: BorderRadius.circular(6)),
        child: Icon(
          iconData,
          size: 16,
        ),
      ),
    );
  }
}
