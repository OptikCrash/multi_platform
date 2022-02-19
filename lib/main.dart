import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:multi_platform/resources/theme/purple_theme.dart';
import 'package:multi_platform/screens/buttons/buttons.dart';
import 'package:multi_platform/screens/fields/fields.dart';
import 'package:multi_platform/screens/main_home/greeting.dart';

import 'enums.dart';
import 'notifiers/screen_indexer.dart';
import 'widgets/buttons.dart';

final mainIndexProvider =
    ChangeNotifierProvider<ScreenIndexProvider>((ref) => ScreenIndexProvider());
final os operatingSystem = (kIsWeb)
    ? os.web
    : (Platform.isIOS)
        ? os.ios
        : (Platform.isMacOS)
            ? os.mac
            : (Platform.isLinux)
                ? os.linux
                : (Platform.isWindows)
                    ? os.windows
                    : os.android;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: Purple.lightTheme,
        darkTheme: Purple.darkTheme,
        home: const Main());
  }
}

class Main extends ConsumerStatefulWidget {
  const Main({Key? key}) : super(key: key);

  @override
  _MainState createState() => _MainState();
}

class _MainState extends ConsumerState<Main> {
  @override
  Widget build(BuildContext context) => Material(child: _selectScaffold);

  get _selectScaffold {
    switch (operatingSystem) {
      case os.mac:
        return _macScaffold;
      case os.linux:
        return _linuxScaffold;
      case os.windows:
        return _windowsScaffold;
      case os.web:
        return _webScaffold;
      case os.ios:
        return _iosScaffold;
      case os.android:
        return _androidScaffold;
    }
  }

  get _index =>
      ref.watch(mainIndexProvider.select((provider) => provider.currentIndex));
  get _macScaffold => Container();
  get _linuxScaffold => Container();
  get _windowsScaffold => Container();
  get _webScaffold => Container();
  get _iosScaffold => OrientationBuilder(
      builder: (context, orientation) => orientation == Orientation.portrait
          ? CupertinoPageScaffold(
              navigationBar: CupertinoNavigationBar(
                middle: _title(_index),
              ),
              child: CupertinoTabScaffold(
                  tabBar: CupertinoTabBar(
                    items: const [
                      BottomNavigationBarItem(
                          icon: Icon(CupertinoIcons.house_fill),
                          label: 'home',
                          activeIcon: Icon(CupertinoIcons.house),
                          tooltip: 'home'),
                      BottomNavigationBarItem(
                          icon: Icon(CupertinoIcons.person_fill),
                          label: 'buttons',
                          activeIcon: Icon(CupertinoIcons.person),
                          tooltip: 'buttons tab'),
                      BottomNavigationBarItem(
                          icon: Icon(CupertinoIcons.settings_solid),
                          label: 'fields',
                          activeIcon: Icon(CupertinoIcons.settings),
                          tooltip: 'fields tab')
                    ],
                    onTap: _navigate,
                    activeColor: Theme.of(context).colorScheme.secondary,
                    backgroundColor: Theme.of(context)
                            .cupertinoOverrideTheme
                            ?.barBackgroundColor ??
                        Colors.pink,
                  ),
                  tabBuilder: (context, index) => _body(index)),
            )
          : CupertinoPageScaffold(
              navigationBar: CupertinoNavigationBar(
                middle: _title(_index),
              ),
              child: CupertinoTabScaffold(
                  tabBar: CupertinoTabBar(
                    items: const [
                      BottomNavigationBarItem(
                          icon: Icon(CupertinoIcons.house_fill),
                          label: 'home',
                          activeIcon: Icon(CupertinoIcons.house),
                          tooltip: 'home'),
                      BottomNavigationBarItem(
                          icon: Icon(CupertinoIcons.person_fill),
                          label: 'buttons',
                          activeIcon: Icon(CupertinoIcons.person),
                          tooltip: 'buttons tab'),
                      BottomNavigationBarItem(
                          icon: Icon(CupertinoIcons.settings_solid),
                          label: 'fields',
                          activeIcon: Icon(CupertinoIcons.settings),
                          tooltip: 'fields tab')
                    ],
                    onTap: _navigate,
                    activeColor: Theme.of(context).colorScheme.secondary,
                    backgroundColor: Theme.of(context)
                            .cupertinoOverrideTheme
                            ?.barBackgroundColor ??
                        Colors.pink,
                  ),
                  tabBuilder: (context, index) => _body(index)),
            ));
  get _androidScaffold => Scaffold(
        appBar: _appBar(_index),
        body: _body(_index),
        bottomNavigationBar: _bottomNav(_index),
      );

  _navigate(int index) {
    ref.read(mainIndexProvider).advanceToIndex(index);
  }

  Widget _body(int currentIndex) {
    switch (currentIndex) {
      case 1:
        return const ButtonsScreen();
      case 2:
        return const FieldsScreen();
      default:
        return const GreetingScreen();
    }
  }

  _bottomNav(int currentIndex) => BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'home',
              activeIcon: Icon(Icons.home_outlined),
              tooltip: 'home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'buttons',
              activeIcon: Icon(Icons.person_outlined),
              tooltip: 'buttons tab'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'fields',
              activeIcon: Icon(Icons.settings_outlined),
              tooltip: 'fields tab')
        ],
        onTap: _navigate,
        currentIndex: _index,
      );
}

_appBar(int currentIndex) => AppBar(
      title: _title(currentIndex),
      actions: [
        NButton.flat(
          child: const Icon(
            Icons.ac_unit_sharp,
            color: Colors.white,
          ),
          onPressed: () {},
        )
      ],
    );
_title(int currentIndex) {
  switch (currentIndex) {
    case 1:
      return const Text('Buttons');
    case 2:
      return const Text('Fields');
    default:
      return const Text('Hello World!');
  }
}
