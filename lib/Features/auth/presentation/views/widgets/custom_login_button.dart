import 'package:flutter/material.dart';
import 'package:fruits_app/core/classes/app_colors.dart';
import 'package:svg_flutter/svg.dart';

import '../../../../../core/classes/text_styles.dart';

class CustomLoginButton extends StatelessWidget {
  const CustomLoginButton({
    super.key,
    required this.labelText,
    required this.image,
    required this.onPressed,
  });

  final String labelText;
  final String image;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 54,
      child: TextButton(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              16,
            ),
          ),
          backgroundColor: Colors.white,
        ),
        onPressed: onPressed,
        child: Row(
          children: [
            Spacer(),
            Text(
              labelText,
              style: TextStyles.semiBold16.copyWith(
                color: AppColors.primaryColor,
              ),
            ),
            Spacer(),
            SvgPicture.asset(
              image,
            ),
          ],
        ),
      ),
    );
  }
}
