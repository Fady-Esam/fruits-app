import 'package:flutter/material.dart';

import '../../../core/classes/app_colors.dart';
import '../../../core/classes/svg_images_handler.dart';
import '../../../core/classes/text_styles.dart';
import 'models/page_view_item_model.dart';

final List<PageViewItemModel> items = [
  PageViewItemModel(
    image: SvgImagesHandler.pageViewItem1,
    backGroundImage: SvgImagesHandler.pageViewItem1Background,
    subTitleText:
        "اكتشف تجربة تسوق فريدة مع FruitHUB. استكشف مجموعتنا الواسعة من الفواكه الطازجة الممتازة واحصل على أفضل العروض والجودة العالية.",
    titleWidget: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'HUB',
          style: TextStyles.bold23.copyWith(
            color: AppColors.secondaryColor,
          ),
        ),
        Text(
          'Fruit',
          style: TextStyles.bold23.copyWith(
            color: AppColors.primaryColor,
          ),
        ),
        const Text(
          '  مرحبًا بك في',
          style: TextStyles.bold23,
        ),
      ],
    ),
  ),
  PageViewItemModel(
    image: SvgImagesHandler.pageViewItem2,
    backGroundImage: SvgImagesHandler.pageViewItem2Background,
    subTitleText:
        " نقدم لك أفضل الفواكه المختارة بعناية. اطلع على التفاصيل والصور والتقييمات لتتأكد من اختيار الفاكهة المثالية",
    titleWidget: Text(
      'ابحث وتسوق',
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Color(0xFF0C0D0D),
        fontSize: 23,
        fontFamily: 'Cairo',
        fontWeight: FontWeight.w700,
        height: 0,
      ),
    ),
  ),
];
