import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:multi_platform/enums.dart';
import 'package:multi_platform/widgets/buttons.dart';
import 'package:multi_platform/widgets/text_field.dart';

import '../../main.dart';

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
    return SingleChildScrollView(
      child: Container(
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
            Card(
              elevation: 6,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Ink(
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 16.0),
                          child: Text(
                            'android card',
                            style: Theme.of(context)
                                .textTheme
                                .headline4
                                ?.copyWith(
                                  color:
                                      Theme.of(context).colorScheme.onPrimary,
                                ),
                          ),
                        )
                      ],
                    ),
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  NTextField.outlined(
                    hintText: 'hint text',
                    labelText: 'user name',
                    useMaterial: true,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            CupertinoFormSection(
              header: Text('iOS form',
                  style: Theme.of(context).textTheme.headline4),
              children: [
                NTextField.outlined(
                  hintText: 'hint text',
                  labelText: 'user name',
                  useCupertino: true,
                ),
                NTextField.outlined(
                  hintText: 'hint text',
                  useCupertino: true,
                  suffixIcon: Icons.ac_unit,
                ),
              ],
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                NButton(onPressed: () {}, child: const Text('Clear')),
                NButton.filled(onPressed: () {}, child: const Text('Submit'))
              ],
            ),
            CupertinoFormSection.insetGrouped(
              header: const Text('Delete me!'),
              children: [
                CupertinoTextFormFieldRow(),
                CupertinoTextFormFieldRow(
                  prefix: const Icon(CupertinoIcons.book),
                  placeholder: 'stuff',
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      color: Colors.blue),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

/*
  username
  password
  phone
  email
*/
