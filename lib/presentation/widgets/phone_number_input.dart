import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lilac_assessment_flutter/core/constants/assets/app_assets.dart';
import 'package:lilac_assessment_flutter/core/themes/app_themes.dart';
import 'package:lilac_assessment_flutter/utils/svg_helper.dart';

class PhoneNumberInput extends StatelessWidget {
  final String countryCode;
  final Function(String countryCode) onCountryTap;
  final TextEditingController controller;

  const PhoneNumberInput({
    super.key,
    required this.countryCode,
    required this.onCountryTap,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),

      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade400),
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
      ),
      child: Row(
        children: [
          SvgHelper.asset(AppIcons.phoneIcon, width: 24, height: 24),
          const SizedBox(width: 8),
          CountryCodePicker(
            onChanged: (selected) {
              onCountryTap(selected.dialCode ?? '');
            },

            initialSelection: 'IN',
            showFlag: false,

            showCountryOnly: false,

            showOnlyCountryWhenClosed: false,

            alignLeft: false,
          ),
          // GestureDetector(
          //   onTap: onCountryTap,
          //   child: Row(
          //     children: [
          //       Text(countryCode, style: AppTextStyles.body1),
          //       const SizedBox(width: 4),
          //       Icon(
          //         Icons.arrow_drop_down,
          //         color: Color(AppColors.lightGrey),
          //         size: 36,
          //       ),
          //     ],
          //   ),
          // ),
          const SizedBox(width: 8),
          Container(width: 1, height: 20, color: Colors.grey.shade300),
          const SizedBox(width: 12),
          Expanded(
            child: TextField(
              controller: controller,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(border: InputBorder.none),
              style: AppTextStyles.body1,
            ),
          ),
        ],
      ),
    );
  }
}
