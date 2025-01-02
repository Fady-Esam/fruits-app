import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:svg_flutter/svg.dart';

import '../../../../../core/classes/svg_images_handler.dart';

import '../../../../On_Boarding/presentation/views/on_board_view.dart';
import '../../../../auth/presentation/views/login_view.dart';



class SpalshViewBody extends StatefulWidget {
  const SpalshViewBody({super.key});

  @override
  State<SpalshViewBody> createState() => _SpalshViewBodyState();
}

class _SpalshViewBodyState extends State<SpalshViewBody> {
  Future<void> executeNavigation() async {
    Future.delayed(const Duration(seconds: 3), () {
      final bool isOnBoardingSeen =
          Hive.box('Seen').get('isOnBoardingViewSeen', defaultValue: false);
      final String route =
          isOnBoardingSeen ? LogInView.routeName : OnBoardView.routeName;
      Navigator.pushReplacementNamed(context, route);
    });
  }

  @override
  void initState() {
    executeNavigation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: SvgPicture.asset(
            SvgImagesHandler.plant,
          ),
        ),
        SvgPicture.asset(
          SvgImagesHandler.logo,
        ),
        SvgPicture.asset(
          SvgImagesHandler.splashBottom,
          fit: BoxFit.fill,
        ),
      ],
    );
  }
}
