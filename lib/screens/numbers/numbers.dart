import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:multi_platform/main.dart';
import 'package:multi_platform/widgets/number_field.dart';

import '../../enums.dart';
import '../../widgets/buttons.dart';

class NumberScreen extends StatefulWidget {
  NumberScreen({Key? key, required this.orientation}) : super(key: key);
  final GlobalKey<FormState> formKey = GlobalKey();
  final String numbers = 'Numbers.';
  final Orientation orientation;

  @override
  _NumberScreenState createState() => _NumberScreenState();
}

class _NumberScreenState extends State<NumberScreen> {
  final TextEditingController androidDefaultControllerA =
      TextEditingController();
  final TextEditingController androidDefaultControllerB =
      TextEditingController();
  final TextEditingController iosDefaultControllerA = TextEditingController();
  final TextEditingController iosDefaultControllerB = TextEditingController();
  final TextEditingController iosDefaultControllerC = TextEditingController();
  final TextEditingController iosDefaultControllerD = TextEditingController();
  final TextEditingController winDefaultControllerA = TextEditingController();
  final TextEditingController winDefaultControllerB = TextEditingController();
  final TextEditingController linuxDefaultControllerA = TextEditingController();
  final TextEditingController linuxDefaultControllerB = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Widget _pageTitle = Text(
      widget.numbers,
      style: Theme.of(context).textTheme.headline1?.copyWith(fontSize: 72),
      textAlign: TextAlign.center,
    );

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
          NNumericField(
            useMaterial: true,
            controller: androidDefaultControllerA,
            labelText: 'default',
            footerRightText: 'footer ->',
            footerLeftText: '<- footer',
            validator: (value) => (androidDefaultControllerA.text.isNotEmpty)
                ? null
                : 'a number must be entered...',
          ),
          NNumericField(
            useMaterial: true,
            isOutlined: true,
            controller: androidDefaultControllerB,
            labelText: 'default',
            footerRightText: 'footer ->',
            footerLeftText: '<- footer',
            validator: (value) => (androidDefaultControllerB.text.isNotEmpty)
                ? null
                : 'a number must be entered...',
          )
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
          NNumericField(
            controller: iosDefaultControllerA,
            labelText: 'default',
            footerRightText: 'footer ->',
            footerLeftText: '<- footer',
            validator: (value) => (iosDefaultControllerA.text.isNotEmpty)
                ? null
                : 'a number must be entered...',
            useCupertino: true,
          ),
          NNumericField(
            isOutlined: true,
            controller: iosDefaultControllerB,
            labelText: 'default',
            footerRightText: 'footer ->',
            footerLeftText: '<- footer',
            validator: (value) => (iosDefaultControllerB.text.isNotEmpty)
                ? null
                : 'a number must be entered...',
            useCupertino: true,
          ),
        ]);
    var _cupertinoSectionInset = CupertinoFormSection.insetGrouped(
        header: Text(
          'iOS form inset grouped',
          style: Theme.of(context)
              .textTheme
              .headline5
              ?.copyWith(fontFamily: 'SanFransisco-Compact'),
        ),
        children: [
          NNumericField(
            controller: iosDefaultControllerC,
            labelText: 'default',
            footerRightText: 'footer ->',
            footerLeftText: '<- footer',
            validator: (value) => (iosDefaultControllerC.text.isNotEmpty)
                ? null
                : 'a number must be entered...',
            useCupertino: true,
          ),
          NNumericField(
            isOutlined: true,
            controller: iosDefaultControllerD,
            labelText: 'default',
            footerRightText: 'footer ->',
            footerLeftText: '<- footer',
            validator: (value) => (iosDefaultControllerD.text.isNotEmpty)
                ? null
                : 'a number must be entered...',
            useCupertino: true,
          ),
        ]);
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
            NNumericField(
              useFluent: true,
              controller: winDefaultControllerA,
              labelText: 'default',
              footerRightText: 'footer ->',
              footerLeftText: '<- footer',
              validator: (value) => (winDefaultControllerA.text.isNotEmpty)
                  ? null
                  : 'a number must be entered...',
            ),
            NNumericField(
              useFluent: true,
              isOutlined: true,
              controller: winDefaultControllerB,
              labelText: 'default',
              footerRightText: 'footer ->',
              footerLeftText: '<- footer',
              validator: (value) => (winDefaultControllerB.text.isNotEmpty)
                  ? null
                  : 'a number must be entered...',
            )
          ],
        ));
    var _linuxSection = Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.only(top: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: Text('Linux form',
                  style: Theme.of(context)
                      .textTheme
                      .headline3
                      ?.copyWith(fontFamily: 'Cantarell')),
            ),
            NNumericField(
              useLinux: true,
              controller: linuxDefaultControllerA,
              labelText: 'default',
              footerRightText: 'footer ->',
              footerLeftText: '<- footer',
              validator: (value) => (linuxDefaultControllerA.text.isNotEmpty)
                  ? null
                  : 'a number must be entered...',
            ),
            NNumericField(
              isOutlined: true,
              controller: linuxDefaultControllerB,
              labelText: 'default',
              footerRightText: 'footer ->',
              footerLeftText: '<- footer',
              validator: (value) => (linuxDefaultControllerB.text.isNotEmpty)
                  ? null
                  : 'a number must be entered...',
            )
          ],
        ),
      ),
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

    Widget _desktopFields() => Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
          child: (widget.orientation != Orientation.portrait)
              ? ListView(
                  children: [
                    Text(
                      widget.numbers,
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
                        widget.numbers,
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
    Widget _mobileFields() => SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _pageTitle,
              ],
            ),
          ),
        );

    switch (operatingSystem) {
      case OS.mac:
        return Form(key: widget.formKey, child: _desktopFields());
      case OS.linux:
        return Form(key: widget.formKey, child: _desktopFields());
      case OS.windows:
        return Form(key: widget.formKey, child: _desktopFields());
      case OS.web:
        return Form(key: widget.formKey, child: _desktopFields());
      case OS.ios:
        return Form(key: widget.formKey, child: _mobileFields());
      case OS.android:
        return Form(key: widget.formKey, child: _mobileFields());
    }
  }
}
