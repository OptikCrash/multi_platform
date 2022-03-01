import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:macos_ui/macos_ui.dart';
import 'package:multi_platform/resources/theme/purple_theme.dart';
import 'package:multi_platform/screens/buttons/buttons.dart';
import 'package:multi_platform/screens/fields/fields.dart';
import 'package:multi_platform/screens/main_home/greeting.dart';

import 'enums.dart';
import 'notifiers/screen_indexer.dart';
import 'screens/numbers/numbers.dart';
import 'widgets/buttons.dart';

final mainIndexProvider =
    ChangeNotifierProvider<ScreenIndexProvider>((ref) => ScreenIndexProvider());
final OS operatingSystem = (kIsWeb)
    ? OS.web
    : (Platform.isIOS)
        ? OS.ios
        : (Platform.isMacOS)
            ? OS.mac
            : (Platform.isLinux)
                ? OS.linux
                : (Platform.isWindows)
                    ? OS.windows
                    : OS.android;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return !(operatingSystem == OS.mac)
        ? MacosApp(
            debugShowCheckedModeBanner: false,
            theme: MacosThemeData.light(),
            darkTheme: MacosThemeData.dark(),
            home: const Main())
        : MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: Purple.lightTheme,
            darkTheme: Purple.darkTheme,
            // theme: ThemeData.light().copyWith(primaryColor: Colors.blue),
            // darkTheme: ThemeData.dark().copyWith(primaryColor: Colors.pink),
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
      case OS.mac:
        return _macScaffold;
      case OS.linux:
        return _linuxScaffold;
      case OS.windows:
        return _windowsScaffold;
      case OS.web:
        return _webScaffold;
      case OS.ios:
        return _iosScaffold;
      case OS.android:
        return _androidScaffold;
    }
  }

  get _index =>
      ref.watch(mainIndexProvider.select((provider) => provider.currentIndex));
  get _macScaffold => OrientationBuilder(
        builder: (context, orientation) {
          return orientation != Orientation.landscape
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
                            tooltip: 'fields tab'),
                        BottomNavigationBarItem(
                            icon: Icon(CupertinoIcons.rocket),
                            label: 'numbers',
                            activeIcon: Icon(CupertinoIcons.rocket_fill),
                            tooltip: 'numbers tab')
                      ],
                      onTap: _navigate,
                      activeColor: Theme.of(context).colorScheme.secondary,
                      backgroundColor: Theme.of(context)
                              .cupertinoOverrideTheme
                              ?.barBackgroundColor ??
                          Colors.pink,
                    ),
                    tabBuilder: (context, i) => (_index == 0)
                        ? const GreetingScreen()
                        : (_index == 1)
                            ? const ButtonsScreen(
                                orientation: Orientation.landscape)
                            : (_index == 2)
                                ? FieldsScreen(
                                    orientation: Orientation.landscape)
                                : NumberScreen(
                                    orientation: Orientation.landscape),
                  ),
                )
              : MacosTheme(
                  data: MacosTheme.of(context),
                  child: MacosWindow(
                    child: Builder(
                      builder: (BuildContext context) => CupertinoTabView(
                        builder: (BuildContext context) => MacosScaffold(
                          titleBar: TitleBar(
                            title: _title(_index),
                            leading: MacosIconButton(
                                icon: (MacosWindowScope.of(context)
                                        .isSidebarShown)
                                    ? Icon(
                                        CupertinoIcons.back,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                      )
                                    : Icon(
                                        CupertinoIcons.forward,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                      ),
                                onPressed: () => _toggle(context)),
                          ),
                          children: [
                            ContentArea(
                              minWidth: 300,
                              builder: (BuildContext context,
                                      ScrollController scrollController) =>
                                  CustomScrollView(
                                controller: scrollController,
                                slivers: [
                                  SliverToBoxAdapter(child: _body(_index))
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    sidebar: Sidebar(
                        minWidth: 0,
                        startWidth: 256,
                        builder: (BuildContext context,
                                ScrollController scrollController) =>
                            SidebarItems(
                              selectedColor: Theme.of(context).primaryColor,
                              currentIndex: _index,
                              onChanged: _navigate,
                              items: [
                                SidebarItem(
                                    leading: (_index == 0)
                                        ? Icon(
                                            CupertinoIcons.house,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onPrimary,
                                          )
                                        : Icon(CupertinoIcons.house_fill,
                                            color:
                                                Theme.of(context).primaryColor),
                                    label: const Text('home'),
                                    semanticLabel: 'home'),
                                SidebarItem(
                                    leading: (_index == 1)
                                        ? Icon(
                                            CupertinoIcons.person,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onPrimary,
                                          )
                                        : Icon(CupertinoIcons.person_fill,
                                            color:
                                                Theme.of(context).primaryColor),
                                    label: const Text('buttons'),
                                    semanticLabel: 'buttons tab'),
                                SidebarItem(
                                    leading: (_index == 2)
                                        ? Icon(
                                            CupertinoIcons.settings_solid,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onPrimary,
                                          )
                                        : Icon(CupertinoIcons.settings,
                                            color:
                                                Theme.of(context).primaryColor),
                                    label: const Text('fields'),
                                    semanticLabel: 'fields tab'),
                                SidebarItem(
                                    leading: (_index == 3)
                                        ? Icon(
                                            CupertinoIcons.rocket,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onPrimary,
                                          )
                                        : Icon(CupertinoIcons.rocket_fill,
                                            color:
                                                Theme.of(context).primaryColor),
                                    label: const Text('numbers'),
                                    semanticLabel: 'numbers tab')
                              ],
                            ),
                        bottom: Text(
                          'bottom',
                          style: Theme.of(context).textTheme.headline4,
                        )),
                  ),
                );
        },
      );
  get _linuxScaffold => Container();
  get _windowsScaffold => _macScaffold;
  get _webScaffold => _windowsScaffold;
  get _iosScaffold => CupertinoPageScaffold(
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
                    tooltip: 'fields tab'),
                BottomNavigationBarItem(
                    icon: Icon(CupertinoIcons.rocket),
                    label: 'numbers',
                    activeIcon: Icon(CupertinoIcons.rocket_fill),
                    tooltip: 'numbers tab')
              ],
              onTap: _navigate,
              activeColor: Theme.of(context).colorScheme.secondary,
              backgroundColor: Theme.of(context)
                      .cupertinoOverrideTheme
                      ?.barBackgroundColor ??
                  Colors.pink,
            ),
            tabBuilder: (context, index) => _body(index)),
      );
  get _androidScaffold => Scaffold(
        appBar: _appBar(_index),
        body: _body(_index),
        bottomNavigationBar: _bottomNav(_index),
      );

  _navigate(int index) {
    setState(() => ref.read(mainIndexProvider).advanceToIndex(index));
  }

  Widget _body(int currentIndex) {
    switch (currentIndex) {
      case 1:
        return const ButtonsScreen(orientation: Orientation.portrait);
      case 2:
        return FieldsScreen(orientation: Orientation.portrait);
      case 3:
        return NumberScreen(orientation: Orientation.portrait);
      default:
        return const GreetingScreen();
    }
  }

  _toggle(BuildContext context) => MacosWindowScope.of(context).toggleSidebar();

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
              tooltip: 'fields tab'),
          BottomNavigationBarItem(
              icon: Icon(Icons.rocket_launch),
              label: 'numbers',
              activeIcon: Icon(Icons.rocket_launch_outlined),
              tooltip: 'numbers tab')
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
    case 3:
      return const Text('Numbers');
    default:
      return const Text('Hello World!');
  }
}
