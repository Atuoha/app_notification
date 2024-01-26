import 'package:flutter/material.dart';

import '../constants/colors.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.function,
    required this.title,
    required this.icon,
  });

  final Function function;
  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColor.secondaryColor,
      ),
      onPressed: () => function(),
      icon: Icon(
        icon,
        color: Colors.white,
      ),
      label: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
