import 'package:flutter/material.dart';
import 'package:fruits_app/core/classes/svg_images_handler.dart';

import '../../../../../core/classes/text_styles.dart';


class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      trailing: const SizedBox(),
      leading: Image.asset(SvgImagesHandler.profileImage),
      title: Text(
        'صباح الخير !..',
        textAlign: TextAlign.right,
        style: TextStyles.regular16.copyWith(
          color: const Color(0xFF949D9E),
        ),
      ),
      subtitle: Text(
        "فادي",
        textAlign: TextAlign.right,
        style: TextStyles.bold16,
      ),
    );
  }
}
