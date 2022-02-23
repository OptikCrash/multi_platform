import 'package:flutter/material.dart';
import 'package:multi_platform/enums.dart';

import '../../main.dart';
import '../../widgets/buttons.dart';

class FieldsScreen extends StatelessWidget {
  const FieldsScreen({Key? key}) : super(key: key);
  final String fields = 'Fields.';

  @override
  Widget build(BuildContext context) {
    switch (operatingSystem) {
      case OS.mac:
      case OS.linux:
      case OS.windows:
      case OS.web:
      case OS.ios:
      case OS.android:
        return _androidFields(context);
    }
  }

  Widget _androidFields(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            fields,
            style:
                Theme.of(context).textTheme.headline1?.copyWith(fontSize: 72),
            textAlign: TextAlign.center,
          ),
          NButton(child: const Text('Default N-Button'), onPressed: () {})
        ],
      ),
    );
  }
}
