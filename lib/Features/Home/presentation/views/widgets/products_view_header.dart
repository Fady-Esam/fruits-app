import 'package:flutter/material.dart';
import 'package:fruits_app/core/classes/svg_images_handler.dart';
import 'package:svg_flutter/svg.dart';

import '../../../../../core/classes/text_styles.dart';


class ProductsViewHeader extends StatelessWidget {
  const ProductsViewHeader({super.key, required this.productsLength});
  final int productsLength;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '$productsLength نتائج',
          textAlign: TextAlign.right,
          style: TextStyles.bold16,
        ),
        const Spacer(),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: ShapeDecoration(
            color: const Color.fromARGB(255, 224, 200, 200),
            shape: RoundedRectangleBorder(
              side: const BorderSide(width: 1, color: Color(0x66CACECE)),
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          child: SvgPicture.asset(
            SvgImagesHandler.filter2,
          ),
        )
      ],
    );
  }
}
