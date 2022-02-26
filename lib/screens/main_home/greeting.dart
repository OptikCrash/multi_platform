import 'package:flutter/material.dart';
import 'package:multi_platform/enums.dart';

import '../../main.dart';

class GreetingScreen extends StatelessWidget {
  const GreetingScreen({Key? key}) : super(key: key);
  final String greeting = 'Greetings!';

  @override
  Widget build(BuildContext context) {
    switch (operatingSystem) {
      case OS.mac:
      case OS.linux:
      case OS.windows:
      case OS.web:
      case OS.ios:
      case OS.android:
        return _androidGreeting(context);
    }
  }

  Widget _androidGreeting(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Text(
              greeting,
              style:
                  Theme.of(context).textTheme.headline1?.copyWith(fontSize: 72),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
