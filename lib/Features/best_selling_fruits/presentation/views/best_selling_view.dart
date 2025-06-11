import 'package:flutter/material.dart';

import '../../../../core/functions/build_app_bar.dart';
import 'widgets/best_selling_view_body.dart';

class BestSellingView extends StatelessWidget {
  const BestSellingView({super.key});
  static const routeName = 'best_selling_view';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, text: 'الأكثر مبيعًا'),
      body:  BestSellingViewBody(),
    );
  }
}
