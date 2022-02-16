import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../colors.dart';

class Purple extends Theme {
  Purple({
    Key? key,
    required Widget child,
  }) : super(key: key, data: lightTheme, child: child);

  static ThemeData light() => lightTheme;

  static ThemeData dark() => darkTheme;

  static ThemeData get lightTheme => ThemeData.light().copyWith(
        primaryColor: RoyalColors.royalPurple,
        colorScheme: RoyalColors.royalPurpleLightScheme,
        cupertinoOverrideTheme: NoDefaultCupertinoThemeData(
          brightness: RoyalColors.royalPurpleLightScheme.brightness,
          primaryColor: RoyalColors.royalPurpleLightScheme.primary,
          primaryContrastingColor:
              RoyalColors.royalPurpleLightScheme.secondaryContainer,
          textTheme: CupertinoTextThemeData(
            primaryColor: RoyalColors.royalPurpleLightScheme.primary,
            textStyle: ThemeData.light()
                .textTheme
                .bodyMedium
                ?.copyWith(color: RoyalColors.royalPurpleLightScheme.onPrimary),
            actionTextStyle: ThemeData.light()
                .textTheme
                .bodyText1
                ?.copyWith(color: RoyalColors.royalPurpleLightScheme.primary),
            tabLabelTextStyle: ThemeData.light()
                .textTheme
                .bodySmall
                ?.copyWith(color: RoyalColors.royalPurpleLightScheme.onPrimary),
            navTitleTextStyle: ThemeData.light()
                .textTheme
                .titleSmall
                ?.copyWith(color: RoyalColors.royalPurpleLightScheme.primary),
            navLargeTitleTextStyle: ThemeData.light()
                .textTheme
                .headline4
                ?.copyWith(color: RoyalColors.royalPurpleLightScheme.onPrimary),
            navActionTextStyle: ThemeData.light()
                .textTheme
                .bodySmall
                ?.copyWith(color: RoyalColors.royalPurpleLightScheme.primary),
            pickerTextStyle: ThemeData.light().textTheme.bodyMedium?.copyWith(
                  color: RoyalColors.royalPurpleDarkScheme.onPrimary,
                ),
            dateTimePickerTextStyle:
                ThemeData.light().textTheme.bodyMedium?.copyWith(
                      color: RoyalColors.royalPurpleDarkScheme.primary,
                    ),
          ),
          barBackgroundColor: ThemeData.light().bottomAppBarColor,
          scaffoldBackgroundColor: ThemeData.light().scaffoldBackgroundColor,
        ),
      );

  static ThemeData get darkTheme => ThemeData.dark().copyWith(
      primaryColor: RoyalColors.royalPurple400,
      colorScheme: RoyalColors.royalPurpleDarkScheme,
      cupertinoOverrideTheme: NoDefaultCupertinoThemeData(
          brightness: RoyalColors.royalPurpleDarkScheme.brightness,
          primaryColor: RoyalColors.royalPurpleDarkScheme.primary,
          primaryContrastingColor:
              RoyalColors.royalPurpleDarkScheme.secondaryContainer,
          textTheme: CupertinoTextThemeData(
              primaryColor: RoyalColors.royalPurpleDarkScheme.primary,
              textStyle: ThemeData.dark().textTheme.bodyMedium?.copyWith(
                  color: RoyalColors.royalPurpleDarkScheme.onPrimary),
              actionTextStyle: ThemeData.dark()
                  .textTheme
                  .bodyText1
                  ?.copyWith(color: RoyalColors.royalPurpleDarkScheme.primary),
              tabLabelTextStyle: ThemeData.dark()
                  .textTheme
                  .bodySmall
                  ?.copyWith(color: RoyalColors.royalPurpleDarkScheme.primary),
              navTitleTextStyle: ThemeData.dark()
                  .textTheme
                  .titleMedium
                  ?.copyWith(color: RoyalColors.royalPurpleDarkScheme.primary),
              navLargeTitleTextStyle: ThemeData.dark()
                  .textTheme
                  .headline4
                  ?.copyWith(color: RoyalColors.royalPurpleDarkScheme.primary),
              navActionTextStyle: ThemeData.dark().textTheme.bodyMedium?.copyWith(
                  color: RoyalColors.royalPurpleDarkScheme.onPrimary),
              pickerTextStyle: ThemeData.dark()
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: RoyalColors.royalPurpleDarkScheme.onPrimary),
              dateTimePickerTextStyle: ThemeData.dark().textTheme.bodyMedium?.copyWith(color: RoyalColors.royalPurpleDarkScheme.onPrimary)),
          barBackgroundColor: ThemeData.dark().bottomAppBarColor,
          scaffoldBackgroundColor: ThemeData.dark().scaffoldBackgroundColor));

  static ThemeData get fallback => ThemeData.fallback();
}
