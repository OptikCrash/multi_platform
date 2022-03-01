import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:multi_platform/enums.dart';
import 'package:multi_platform/widgets/buttons.dart';
import 'package:multi_platform/widgets/text_field.dart';

import '../../main.dart';

class FieldsScreen extends StatefulWidget {
  FieldsScreen({Key? key, required this.orientation}) : super(key: key);
  final GlobalKey<FormState> formKey = GlobalKey();
  final String fields = 'Fields.';
  final Orientation orientation;

  @override
  _FieldsScreenState createState() => _FieldsScreenState();
}

class _FieldsScreenState extends State<FieldsScreen> {
  @override
  Widget build(BuildContext context) {
    var _androidCard = Card(
      elevation: 6,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Ink(
            color: Theme.of(context).colorScheme.primary,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: Text('android card',
                  style: Theme.of(context).textTheme.headline3?.copyWith(
                      fontFamily: 'Roboto',
                      color: Theme.of(context).colorScheme.onPrimary)),
            ),
          ),
          NTextField(
            hintText: 'hint text',
            labelText: 'default',
            useMaterial: true,
            validator: (value) => (value?.isEmpty == true) ? 'empty' : null,
          ),
          NTextField.filled(
            hintText: 'hint text',
            labelText: 'default filled',
            useMaterial: true,
            suffixIcon: Icons.ac_unit,
            validator: (value) => (value?.isEmpty == true) ? 'empty' : null,
          ),
          NTextField.outlined(
            hintText: 'hint text',
            labelText: 'outlined default',
            useMaterial: true,
            validator: (value) => (value?.isEmpty == true) ? 'empty' : null,
          ),
          NTextField.hollow(
            hintText: 'hint text',
            labelText: 'outlined not filled',
            useMaterial: true,
            controller: TextEditingController(),
            hasClearButton: true,
            validator: (value) => (value?.isEmpty == true) ? 'empty' : null,
          ),
        ],
      ),
    );
    var _cupertinoSection = CupertinoFormSection(
      header: Text('iOS form',
          style: Theme.of(context)
              .textTheme
              .headline4
              ?.copyWith(fontFamily: 'SanFransisco-Compact')),
      children: [
        NTextField(
          hintText: 'hint text',
          labelText: 'default',
          useCupertino: true,
          validator: (value) => (value?.isEmpty == true) ? 'empty' : null,
        ),
        NTextField.filled(
          hintText: 'hint text',
          labelText: 'default filled',
          useCupertino: true,
          suffixIcon: Icons.ac_unit,
          validator: (value) => (value?.isEmpty == true) ? 'empty' : null,
        ),
      ],
    );
    var _cupertinoSectionInset = CupertinoFormSection.insetGrouped(
      header: Text(
        'iOS form inset grouped',
        style: Theme.of(context)
            .textTheme
            .headline5
            ?.copyWith(fontFamily: 'SanFransisco-Compact'),
      ),
      children: [
        NTextField.outlined(
          hintText: 'hint text',
          labelText: 'outlined default',
          useCupertino: true,
          validator: (value) => (value?.isEmpty == true) ? 'empty' : null,
        ),
        NTextField.hollow(
          hintText: 'hint text',
          labelText: 'outlined not filled',
          useCupertino: true,
          controller: TextEditingController(),
          hasClearButton: true,
          validator: (value) => (value?.isEmpty == true) ? 'empty' : null,
        ),
      ],
    );
    var _windowsSection = Container(
        color: Theme.of(context).colorScheme.secondary.withOpacity(0.1),
        padding: const EdgeInsets.only(top: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              child: Text('Windows form',
                  style: Theme.of(context)
                      .textTheme
                      .headline3
                      ?.copyWith(fontFamily: 'Segoe')),
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 600, maxHeight: 300),
              child: NTextField(
                hintText: 'hint text',
                labelText: 'default',
                useFluent: true,
                validator: (value) => (value?.isEmpty == true) ? 'empty' : null,
              ),
            ),
            NTextField.filled(
              hintText: 'hint text',
              labelText: 'default filled',
              useFluent: true,
              suffixIcon: Icons.ac_unit,
              validator: (value) => (value?.isEmpty == true) ? 'empty' : null,
            ),
            NTextField.outlined(
              hintText: 'hint text',
              labelText: 'outlined default',
              useFluent: true,
              validator: (value) => (value?.isEmpty == true) ? 'empty' : null,
            ),
            NTextField.hollow(
              hintText: 'hint text',
              labelText: 'outlined not filled',
              useFluent: true,
              controller: TextEditingController(),
              hasClearButton: true,
              validator: (value) => (value?.isEmpty == true) ? 'empty' : null,
            ),
          ],
        ));
    var _linuxSection = Card(
      elevation: 5,
      child: Padding(
          padding: const EdgeInsets.only(top: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                child: Text('Linux form',
                    style: Theme.of(context)
                        .textTheme
                        .headline3
                        ?.copyWith(fontFamily: 'Cantarell')),
              ),
              ConstrainedBox(
                constraints:
                    const BoxConstraints(maxWidth: 600, maxHeight: 300),
                child: NTextField(
                  hintText: 'hint text',
                  labelText: 'default',
                  useLinux: true,
                  validator: (value) =>
                      (value?.isEmpty == true) ? 'empty' : null,
                ),
              ),
              NTextField.filled(
                hintText: 'hint text',
                labelText: 'default filled',
                useLinux: true,
                suffixIcon: Icons.ac_unit,
                validator: (value) => (value?.isEmpty == true) ? 'empty' : null,
              ),
              NTextField.outlined(
                hintText: 'hint text',
                labelText: 'outlined default',
                useLinux: true,
                validator: (value) => (value?.isEmpty == true) ? 'empty' : null,
              ),
              NTextField.hollow(
                hintText: 'hint text',
                labelText: 'outlined not filled',
                useLinux: true,
                controller: TextEditingController(),
                hasClearButton: true,
                validator: (value) => (value?.isEmpty == true) ? 'empty' : null,
              ),
            ],
          )),
    );
    var _clearOrValidate = Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        NButton(
            onPressed: () {
              final formState = widget.formKey.currentState;
              formState?.reset();
            },
            child: const Text('Clear')),
        NButton.filled(
            onPressed: () {
              final formState = widget.formKey.currentState;
              if (formState?.validate() == false) {}
            },
            child: const Text('Submit'))
      ],
    );
    Widget _desktopFields(BuildContext context) => Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
          child: (widget.orientation != Orientation.portrait)
              ? ListView(
                  children: [
                    Text(
                      widget.fields,
                      style: Theme.of(context)
                          .textTheme
                          .headline1
                          ?.copyWith(fontSize: 72),
                      textAlign: TextAlign.center,
                    ),
                    _androidCard,
                    const SizedBox(height: 24),
                    _cupertinoSection,
                    const SizedBox(height: 24),
                    _cupertinoSectionInset,
                    const SizedBox(height: 24),
                    _windowsSection,
                    const SizedBox(height: 24),
                    _linuxSection,
                    const SizedBox(height: 24),
                    _clearOrValidate,
                    const SizedBox(height: 24),
                  ],
                )
              : Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ConstrainedBox(
                      constraints: const BoxConstraints(
                          maxWidth: double.infinity, maxHeight: 300),
                      child: Text(
                        widget.fields,
                        style: Theme.of(context)
                            .textTheme
                            .headline1
                            ?.copyWith(fontSize: 72),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(child: _androidCard),
                        const SizedBox(width: 16),
                        Expanded(
                            child: Column(
                          children: [_cupertinoSection, _cupertinoSectionInset],
                        )),
                      ],
                    ),
                    const SizedBox(height: 24),
                    Row(
                      children: [
                        Expanded(child: _windowsSection),
                        const SizedBox(width: 16),
                        Expanded(child: _linuxSection),
                      ],
                    ),
                    const SizedBox(height: 24),
                    _clearOrValidate,
                    const SizedBox(height: 24),
                  ],
                ),
        );
    Widget _mobileFields(BuildContext context) => SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  widget.fields,
                  style: Theme.of(context)
                      .textTheme
                      .headline1
                      ?.copyWith(fontSize: 72),
                  textAlign: TextAlign.center,
                ),
                _androidCard,
                const SizedBox(height: 24),
                _cupertinoSection,
                const SizedBox(height: 24),
                _cupertinoSectionInset,
                const SizedBox(height: 24),
                _windowsSection,
                const SizedBox(height: 24),
                _linuxSection,
                const SizedBox(height: 24),
                _clearOrValidate,
              ],
            ),
          ),
        );

    switch (operatingSystem) {
      case OS.mac:
        return Form(key: widget.formKey, child: _desktopFields(context));
      case OS.linux:
        return Form(key: widget.formKey, child: _desktopFields(context));
      case OS.windows:
        return Form(key: widget.formKey, child: _desktopFields(context));
      case OS.web:
        return Form(key: widget.formKey, child: _desktopFields(context));
      case OS.ios:
        return Form(key: widget.formKey, child: _mobileFields(context));
      case OS.android:
      default:
        return Form(key: widget.formKey, child: _mobileFields(context));
    }
  }
}
/*
  username
  password
  phone
  email

    OrientationBuilder(
      builder: (context, orientation) => orientation == Orientation.portrait
          ? Container()
          : Container(),
    )
*/
