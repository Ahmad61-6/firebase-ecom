import 'package:flutter/material.dart';

import '../../../../app/app_colors.dart';

class CustomTitleAndSubtitle extends StatelessWidget {
  final String title;
  final String subtitle;
  final double? subfontSize;
  final FontWeight? subfontWight;

  const CustomTitleAndSubtitle({
    super.key,
    required this.title,
    required this.subtitle,
    this.subfontSize,
    this.subfontWight,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: AppColors.primaryColor,
            fontWeight: FontWeight.bold,
            fontSize: 35,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          subtitle,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black.withOpacity(.6),
            fontSize: subfontSize ?? 15,
            fontWeight: subfontWight ?? FontWeight.normal,
          ),
        ),
      ],
    );
  }
}
