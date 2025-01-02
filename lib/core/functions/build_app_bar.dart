import 'package:flutter/material.dart';

import '../classes/text_styles.dart';

AppBar buildAppBar(BuildContext context, {required String text}) {
  return AppBar(
    automaticallyImplyLeading: false,
    actions: [
      IconButton(
        icon: Transform.rotate(
          angle: 180 * 3.14 / 180,
          child: const Icon(
            Icons.arrow_back_ios_new,
          ),
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      )
    ],
    centerTitle: true,
    title: Text(
      text,
      style: TextStyles.bold19,
    ),
  );
}
