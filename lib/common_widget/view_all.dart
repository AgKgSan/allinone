import 'package:flutter/material.dart';

import '../common/color_extension.dart';

class ViewAll extends StatelessWidget {
  final String title;
  final VoidCallback onView;
  const ViewAll({
    super.key,
    required this.title,
    required this.onView,
  });

  @override
  Widget build(BuildContext context) {
    
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
              color: TColor.primaryText,
              fontSize: 20,
              fontWeight: FontWeight.w800),
        ),
        TextButton(
          onPressed: onView,
          child: Text(
            "View all",
            style: TextStyle(
              color: TColor.primary,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
