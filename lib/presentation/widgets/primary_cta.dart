import 'package:flutter/material.dart';
import 'package:lilac_assessment_flutter/core/constants/app_colors/app_colors.dart';
import 'package:lilac_assessment_flutter/core/themes/app_themes.dart';






class PrimaryCTA extends StatelessWidget {
  final Widget icon;
  final String label;
  final VoidCallback onPressed;
  final Color color;
final Color? textColor;
  const PrimaryCTA({
    super.key,
    required this.icon,
    required this.label,
    required this.onPressed,
    this.color = Colors.white, 
    this.textColor =  AppTextColors.button1Color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(45),
          ),
          backgroundColor: color,
          elevation: 0,
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(height: 24, width: 24, child: icon),
            const SizedBox(width: 8),
            Text(label, style: AppTextStyles.button1.copyWith(color: textColor)),
          ],
        ),
      ),
    );
  }
}
