import 'package:flutter/material.dart';

void buildErrorMessageBar(BuildContext context, String textMessage) {
  ScaffoldMessenger.of(context)
      .showSnackBar(SnackBar(content: Text(textMessage)));
}
