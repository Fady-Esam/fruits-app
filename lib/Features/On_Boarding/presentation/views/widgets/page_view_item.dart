

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:svg_flutter/svg.dart';

import '../../../../../core/classes/text_styles.dart';

import '../../../../../core/widgets/custom_button.dart';
import '../../../data/models/page_view_item_model.dart';

class PageViewItem extends StatefulWidget {
  const PageViewItem({
    super.key,
    required this.model,
    required this.itemIndex,
  });
  final PageViewItemModel model;
  final int itemIndex;

  @override
  State<PageViewItem> createState() => _PageViewItemState();
}

class _PageViewItemState extends State<PageViewItem> {

  void exectueNavigation(BuildContext context) {
    Hive.box('Seen').put('isOnBoardingViewSeen', true);
    Navigator.pushReplacementNamed(context, 'login');
  }

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.5,
          child: Stack(
            children: [
              Positioned.fill(
                child: SvgPicture.asset(
                  widget.model.backGroundImage,
                  fit: BoxFit.fill,
                ),
              ),
              if (widget.itemIndex == 0)
                Positioned(
                  top: 10,
                  right: 0,
                  child: GestureDetector(
                    onTap: () => exectueNavigation(context),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Text(
                        'تخط',
                        style: TextStyles.regular13.copyWith(
                          color: const Color.fromARGB(255, 36, 52, 54),
                        ),
                      ),
                    ),
                  ),
                ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: SvgPicture.asset(
                  widget.model.image,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 60,
        ),
        widget.model.titleWidget,
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 37,
          ),
          child: Text(
            widget.model.subTitleText,
            textAlign: TextAlign.center,
            style: TextStyles.semiBold13.copyWith(
              color: const Color(0xFF4E5456),
            ),
          ),
        ),
        if (widget.itemIndex == 1) ...[
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.14,
          ),
          CustomButton(
              onPressed: () => exectueNavigation(context), text: "ابدأ الآن"),
        ]
      ],
    );
  }
}
