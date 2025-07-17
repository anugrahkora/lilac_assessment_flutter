import 'package:flutter/material.dart';
import 'package:lilac_assessment_flutter/core/constants/app_colors/app_colors.dart';
import 'package:lilac_assessment_flutter/core/themes/app_themes.dart';

class GradientCTA extends StatelessWidget {
  final Widget? icon;
  final String label;
  final VoidCallback onPressed;
  final Gradient gradient;
  final Color? textColor;
  final bool isLoading;

  const GradientCTA({
    super.key,
    this.icon,
    required this.label,
    required this.onPressed,
    this.gradient = const LinearGradient(
      colors: AppColors.primaryGradient,
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    ),
    this.textColor = Colors.white,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: BorderRadius.circular(45),
        boxShadow: [
          BoxShadow(
            color: Color(0xffF05C83).withValues(alpha: 0.2),
            offset: const Offset(0, 4),
            blurRadius: 12,
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(45),
        child: InkWell(
          borderRadius: BorderRadius.circular(45),
          splashColor: AppColors.primaryColor,
          onTap: onPressed,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                icon != null
                    ? SizedBox(height: 24, width: 24, child: icon)
                    : SizedBox(),
                const SizedBox(width: 8),
                if (isLoading)
                  const SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(
                      color: Colors.white,
                      strokeWidth: 2
                      ,
                    ),
                  )
                else
                  Text(
                    label,
                    style: AppTextStyles.button1.copyWith(color: textColor),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
