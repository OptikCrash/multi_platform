import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:multi_platform/enums.dart';
import 'package:multi_platform/widgets/buttons.dart';
import 'package:multi_platform/widgets/text_field.dart';

import '../../main.dart';

class FieldsScreen extends StatefulWidget {
  const FieldsScreen({Key? key}) : super(key: key);
  final String fields = 'Fields.';

  @override
  _FieldsScreenState createState() => _FieldsScreenState();
}

class _FieldsScreenState extends State<FieldsScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    switch (operatingSystem) {
      case OS.mac:
      case OS.linux:
      case OS.windows:
      case OS.web:
      case OS.ios:
      case OS.android:
        return Form(key: _formKey, child: _androidFields(context));
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
              widget.fields,
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
                  NTextField(
                    hintText: 'hint text',
                    labelText: 'default',
                    useMaterial: true,
                    validator: (value) =>
                        (value?.isEmpty == true) ? 'empty' : null,
                  ),
                  NTextField(
                    filled: true,
                    hintText: 'hint text',
                    labelText: 'default filled',
                    useMaterial: true,
                    suffixIcon: Icons.ac_unit,
                    validator: (value) =>
                        (value?.isEmpty == true) ? 'empty' : null,
                  ),
                  NTextField.outlined(
                    hintText: 'hint text',
                    labelText: 'outlined default',
                    useMaterial: true,
                    validator: (value) =>
                        (value?.isEmpty == true) ? 'empty' : null,
                  ),
                  NTextField.outlined(
                    hintText: 'hint text',
                    labelText: 'outlined not filled',
                    filled: false,
                    useMaterial: true,
                    suffixIcon: Icons.ac_unit,
                    validator: (value) =>
                        (value?.isEmpty == true) ? 'empty' : null,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            CupertinoFormSection(
              header: Text('iOS form',
                  style: Theme.of(context).textTheme.headline4),
              children: [
                NTextField(
                  hintText: 'hint text',
                  labelText: 'default',
                  useCupertino: true,
                  validator: (value) =>
                      (value?.isEmpty == true) ? 'empty' : null,
                ),
                NTextField(
                  hintText: 'hint text',
                  labelText: 'default filled',
                  useCupertino: true,
                  filled: true,
                  suffixIcon: Icons.ac_unit,
                  validator: (value) =>
                      (value?.isEmpty == true) ? 'empty' : null,
                ),
              ],
            ),
            const SizedBox(height: 24),
            CupertinoFormSection.insetGrouped(
              header: const Text('iOS form inset grouped'),
              children: [
                NTextField.outlined(
                  hintText: 'hint text',
                  labelText: 'outlined default',
                  useCupertino: true,
                  validator: (value) =>
                      (value?.isEmpty == true) ? 'empty' : null,
                ),
                NTextField.outlined(
                  hintText: 'hint text',
                  labelText: 'outlined not filled',
                  filled: false,
                  useCupertino: true,
                  suffixIcon: Icons.ac_unit,
                  validator: (value) =>
                      (value?.isEmpty == true) ? 'empty' : null,
                ),
              ],
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                NButton(
                    onPressed: () {
                      final formState = _formKey.currentState;
                      formState?.reset();
                      setState(() {});
                    },
                    child: const Text('Clear')),
                NButton.filled(
                    onPressed: () {
                      final formState = _formKey.currentState;
                      if (formState?.validate() == false) {}
                      setState(() {});
                    },
                    child: const Text('Submit'))
              ],
            ),
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
