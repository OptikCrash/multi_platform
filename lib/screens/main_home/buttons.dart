import 'package:flutter/material.dart';
import 'package:multi_platform/enums.dart';

import '../../main.dart';

class ButtonsScreen extends StatelessWidget {
  const ButtonsScreen({Key? key}) : super(key: key);
  final String buttons = 'Buttons.';

  @override
  Widget build(BuildContext context) {
    switch (operatingSystem) {
      case os.mac:
      case os.linux:
      case os.windows:
      case os.web:
      case os.ios:
      case os.android:
        return _androidButtons(context);
    }
  }

  Widget _androidButtons(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            buttons,
            style:
                Theme.of(context).textTheme.headline1?.copyWith(fontSize: 72),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
