import 'package:flutter/material.dart';
import 'package:multi_platform/enums.dart';

import '../../main.dart';
import '../../widgets/buttons.dart';

class ButtonsScreen extends StatelessWidget {
  const ButtonsScreen({Key? key}) : super(key: key);
  final String buttons = 'Buttons.';

  @override
  Widget build(BuildContext context) {
    Widget _pageTitle = Text(
      buttons,
      style: Theme.of(context).textTheme.headline1?.copyWith(fontSize: 72),
      textAlign: TextAlign.center,
    );
    Widget _groupN = Wrap(
      children: [
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
      ],
    );
    Widget _groupA = Wrap(
      children: [
        Text('android Buttons', style: Theme.of(context).textTheme.titleMedium),
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
      ],
    );
    Widget _groupI = Wrap(
      children: [
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
      ],
    );
    Widget _groupW = Wrap(
      children: [
        Text('Windows Buttons', style: Theme.of(context).textTheme.titleMedium),
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
      ],
    );
    Widget _groupM = Wrap(
      children: [
        Text('macOS Buttons', style: Theme.of(context).textTheme.titleMedium),
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
      ],
    );
    Widget _groupL = Wrap(
      children: [
        Text('Linux Buttons', style: Theme.of(context).textTheme.titleMedium),
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
      ],
    );
    Widget _groupWWW = Wrap(
      children: [
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
    );
    Widget _landscapeN = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('N-Buttons', style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 8),
        Row(children: [
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
          const SizedBox(width: 8),
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
        ]),
        const SizedBox(height: 16),
      ],
    );
    Widget _landscapeA = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('android Buttons', style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 8),
        Row(children: [
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
          const SizedBox(width: 8),
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
        ]),
        const SizedBox(height: 16),
      ],
    );
    Widget _landscapeI = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('iOS Buttons', style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 8),
        Row(children: [
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
          const SizedBox(width: 8),
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
        ]),
        const SizedBox(height: 16),
      ],
    );
    Widget _landscapeW = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Windows Buttons', style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 8),
        Row(children: [
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
          const SizedBox(width: 8),
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
        ]),
        const SizedBox(height: 16),
      ],
    );
    Widget _landscapeM = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('macOS Buttons', style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 8),
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
            const SizedBox(width: 8),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: NButton(
                onPressed: () {},
                child: const Text('Grey'),
                isGrey: true,
                useCupertinoPro: true,
              ),
            ),
            const SizedBox(width: 8),
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
        const SizedBox(height: 16),
      ],
    );
    Widget _landscapeL = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Linux Buttons', style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 8),
        Row(children: [
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
          const SizedBox(width: 8),
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
        ]),
        const SizedBox(height: 16),
      ],
    );
    Widget _landscapeWWW = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Web Buttons', style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 8),
        Row(children: [
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
          const SizedBox(width: 8),
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
        ]),
        const SizedBox(height: 16),
      ],
    );
    switch (operatingSystem) {
      case OS.mac:
        return OrientationBuilder(
            builder: (BuildContext context, Orientation orientation) =>
                (orientation != Orientation.landscape)
                    ? _buttonsView(_pageTitle, _groupN, _groupA, _groupI,
                        _groupW, _groupM, _groupL, _groupWWW)
                    : _buttonsView(
                        _pageTitle,
                        _landscapeN,
                        _landscapeA,
                        _landscapeI,
                        _landscapeW,
                        _landscapeM,
                        _landscapeL,
                        _landscapeWWW));
      case OS.linux:
      case OS.windows:
      case OS.web:
      case OS.ios:
      case OS.android:
        return _buttonsView(_pageTitle, _groupN, _groupA, _groupI, _groupW,
            _groupM, _groupL, _groupWWW);
    }
  }

  Widget _buttonsView(
    Widget pageTitle,
    Widget groupN,
    Widget groupA,
    Widget groupI,
    Widget groupW,
    Widget groupM,
    Widget groupL,
    Widget groupWWW,
  ) {
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            pageTitle,
            groupN,
            groupA,
            groupI,
            groupW,
            groupM,
            groupL,
            groupWWW,
          ],
        ),
      ),
    );
  }
}
