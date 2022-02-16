import 'package:flutter/material.dart';
import 'package:multi_platform/enums.dart';

import '../../main.dart';

class FieldsScreen extends StatelessWidget {
  const FieldsScreen({Key? key}) : super(key: key);
  final String fields = 'Fields.';

  @override
  Widget build(BuildContext context) {
    switch (operatingSystem) {
      case os.mac:
      case os.linux:
      case os.windows:
      case os.web:
      case os.ios:
      case os.android:
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
        ],
      ),
    );
  }
}
