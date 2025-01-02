
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

import '../../../../../core/classes/app_colors.dart';
import '../../../data/page_view_items.dart';
import 'page_view_item.dart';

class OnBoardViewBody extends StatefulWidget {
  const OnBoardViewBody({super.key});

  @override
  State<OnBoardViewBody> createState() => _OnBoardViewBodyState();
}

class _OnBoardViewBodyState extends State<OnBoardViewBody> {
  late PageController _controller;
  int currentPageIndex = 0;
  @override
  void initState() {
    super.initState();
    _controller = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: PageView(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                currentPageIndex = index;
              });
            },
            children: items
                .asMap()
                .entries
                .map((entry) =>
                    PageViewItem(model: entry.value, itemIndex: entry.key))
                .toList(),
          ),
        ),
        DotsIndicator(
          position: currentPageIndex,
          onTap: (index) {
            _controller.animateToPage(
              index.toInt(),
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeIn,
            );
          },
          dotsCount: 2,
          decorator: DotsDecorator(
            color: AppColors.primaryColor.withAlpha(128),
            activeColor: AppColors.primaryColor,
          ),
        ),
      ],
    );
  }
}
