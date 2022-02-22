import 'package:flutter/material.dart';
import 'package:multi_platform/enums.dart';

import '../../main.dart';
import '../../widgets/buttons.dart';

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
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              buttons,
              style:
                  Theme.of(context).textTheme.headline1?.copyWith(fontSize: 72),
              textAlign: TextAlign.center,
            ),
            Text('N-Buttons', style: Theme.of(context).textTheme.titleMedium),
            Row(
              children: [
                NButton(
                  onPressed: () {},
                  child: const Text('Default'),
                ),
                const SizedBox(width: 8),
                NButton(
                  onPressed: () {},
                  child: const Text('Flat'),
                  isFlat: true,
                ),
                const SizedBox(width: 8),
                NButton(
                  onPressed: () {},
                  child: const Text('Grey'),
                  isGrey: true,
                ),
              ],
            ),
            Row(
              children: [
                NButton(
                  onPressed: () {},
                  child: const Text('Tinted'),
                  isTinted: true,
                ),
                const SizedBox(width: 8),
                NButton(
                  onPressed: () {},
                  child: const Text('Filled'),
                  isFilled: true,
                ),
              ],
            ),
            Text('android Buttons',
                style: Theme.of(context).textTheme.titleMedium),
            Row(
              children: [
                NButton(
                  onPressed: () {},
                  child: const Text('Material'),
                  useMaterial: true,
                ),
                const SizedBox(width: 8),
                NButton(
                  onPressed: () {},
                  child: const Text('Flat'),
                  isFlat: true,
                  useMaterial: true,
                ),
                const SizedBox(width: 8),
                NButton(
                  onPressed: () {},
                  child: const Text('Grey'),
                  isGrey: true,
                  useMaterial: true,
                ),
              ],
            ),
            Row(
              children: [
                NButton(
                  onPressed: () {},
                  child: const Text('Tinted'),
                  isTinted: true,
                  useMaterial: true,
                ),
                const SizedBox(width: 8),
                NButton(
                  onPressed: () {},
                  child: const Text('Filled'),
                  isFilled: true,
                  useMaterial: true,
                ),
              ],
            ),
            Text('iOS Buttons', style: Theme.of(context).textTheme.titleMedium),
            Row(
              children: [
                NButton(
                  onPressed: () {},
                  child: const Text('Cupertino'),
                  useCupertino: true,
                ),
                const SizedBox(width: 8),
                NButton(
                  onPressed: () {},
                  child: const Text('Flat'),
                  isFlat: true,
                  useCupertino: true,
                ),
                const SizedBox(width: 8),
                NButton(
                  onPressed: () {},
                  child: const Text('Grey'),
                  isGrey: true,
                  useCupertino: true,
                ),
              ],
            ),
            Row(
              children: [
                NButton(
                  onPressed: () {},
                  child: const Text('Tinted'),
                  isTinted: true,
                  useCupertino: true,
                ),
                const SizedBox(width: 8),
                NButton(
                  onPressed: () {},
                  child: const Text('Filled'),
                  isFilled: true,
                  useCupertino: true,
                ),
              ],
            ),
            Text('Windows Buttons',
                style: Theme.of(context).textTheme.titleMedium),
            Row(
              children: [
                NButton(
                  onPressed: () {},
                  child: const Text('Fluent'),
                  useFluent: true,
                ),
                const SizedBox(width: 8),
                NButton(
                  onPressed: () {},
                  child: const Text('Flat'),
                  isFlat: true,
                  useFluent: true,
                ),
                const SizedBox(width: 8),
                NButton(
                  onPressed: () {},
                  child: const Text('Grey'),
                  isGrey: true,
                  useFluent: true,
                ),
              ],
            ),
            Row(
              children: [
                NButton(
                  onPressed: () {},
                  child: const Text('Tinted'),
                  isTinted: true,
                  useFluent: true,
                ),
                const SizedBox(width: 8),
                NButton(
                  onPressed: () {},
                  child: const Text('Filled'),
                  isFilled: true,
                  useFluent: true,
                ),
              ],
            ),
            Text('macOS Buttons',
                style: Theme.of(context).textTheme.titleMedium),
            Row(
              children: [
                NButton(
                  onPressed: () {},
                  child: const Text('Cupertino-Pro'),
                  useCupertinoPro: true,
                ),
                const SizedBox(width: 8),
                NButton(
                  onPressed: () {},
                  child: const Text('Flat'),
                  isFlat: true,
                  useCupertinoPro: true,
                ),
              ],
            ),
            const SizedBox(width: 8),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: NButton(
                    onPressed: () {},
                    child: const Text('Grey'),
                    isGrey: true,
                    useCupertinoPro: true,
                  ),
                ),
              ],
            ),
            const SizedBox(width: 8),
            Row(
              children: [
                NButton(
                  onPressed: () {},
                  child: const Text('Tinted'),
                  isTinted: true,
                  useCupertinoPro: true,
                ),
                const SizedBox(width: 8),
                NButton(
                  onPressed: () {},
                  child: const Text('Filled'),
                  isFilled: true,
                  useCupertinoPro: true,
                ),
              ],
            ),
            Text('Linux Buttons',
                style: Theme.of(context).textTheme.titleMedium),
            Row(
              children: [
                NButton(
                  onPressed: () {},
                  child: const Text('Linux?'),
                  useLinux: true,
                ),
                const SizedBox(width: 8),
                NButton(
                  onPressed: () {},
                  child: const Text('Flat'),
                  isFlat: true,
                  useLinux: true,
                ),
                const SizedBox(width: 8),
                NButton(
                  onPressed: () {},
                  child: const Text('Grey'),
                  isGrey: true,
                  useLinux: true,
                ),
              ],
            ),
            Row(
              children: [
                NButton(
                  onPressed: () {},
                  child: const Text('Tinted'),
                  isTinted: true,
                  useLinux: true,
                ),
                const SizedBox(width: 8),
                NButton(
                  onPressed: () {},
                  child: const Text('Filled'),
                  isFilled: true,
                  useLinux: true,
                ),
              ],
            ),
            Text('Web Buttons', style: Theme.of(context).textTheme.titleMedium),
            Row(
              children: [
                NButton(
                  onPressed: () {},
                  child: const Text('Web'),
                  useWeb: true,
                  corner: CornerType.beveled,
                ),
                const SizedBox(width: 8),
                NButton(
                  onPressed: () {},
                  child: const Text('Flat'),
                  isFlat: true,
                  useWeb: true,
                  corner: CornerType.beveled,
                ),
                const SizedBox(width: 8),
                NButton(
                  onPressed: () {},
                  child: const Text('Grey'),
                  isGrey: true,
                  useWeb: true,
                  corner: CornerType.beveled,
                ),
              ],
            ),
            const SizedBox(height: 6),
            Row(
              children: [
                NButton(
                  onPressed: () {},
                  child: const Text('Tinted'),
                  isTinted: true,
                  useWeb: true,
                  corner: CornerType.beveled,
                ),
                const SizedBox(width: 8),
                NButton(
                  onPressed: () {},
                  child: const Text('Filled'),
                  isFilled: true,
                  useWeb: true,
                  corner: CornerType.beveled,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
