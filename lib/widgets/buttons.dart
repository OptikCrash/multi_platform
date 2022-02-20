import 'dart:io';
import 'dart:math' as math;
import 'dart:ui' show lerpDouble;
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../enums.dart';

// Measured against iOS 12 in Xcode.
const EdgeInsets _kButtonPadding = EdgeInsets.all(8.0);
const EdgeInsets _kBackgroundButtonPadding = EdgeInsets.symmetric(
  vertical: 14.0,
  horizontal: 64.0,
);
final os _operatingSystem = (kIsWeb)
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

class NButton extends ButtonStyleButton {
  //region constructors
  const NButton({
    Key? key,
    required this.onPressed,
    required this.child,
    this.onLongPress,
    this.onHover,
    this.onFocusChange,
    this.style,
    this.focusNode,
    this.padding,
    this.pressedOpacity,
    this.onHighlightChanged,
    this.mouseCursor,
    this.enabledMouseCursor,
    this.hoveredMouseCursor,
    this.disabledMouseCursor,
    this.textStyle,
    this.fillColor,
    this.focusColor,
    this.hoverColor,
    this.highlightColor,
    this.splashColor,
    this.disabledColor = CupertinoColors.quaternarySystemFill,
    this.autofocus = false,
    this.clipBehavior = Clip.none,
    this.alignment = Alignment.center,
    this.minSize = kMinInteractiveDimensionCupertino,
    this.borderRadius = const BorderRadius.all(Radius.circular(8.0)),
    this.elevation,
    this.hoverElevation,
    this.focusElevation,
    this.highlightElevation,
    this.disabledElevation,
    this.visualDensity = VisualDensity.standard,
    this.constraints = const BoxConstraints(minWidth: 86.0, minHeight: 36.0),
    this.shape = const RoundedRectangleBorder(
      side: BorderSide(color: CupertinoColors.inactiveGray),
      borderRadius: BorderRadius.all(Radius.circular(8.0)),
    ),
    this.animationDuration = kThemeChangeDuration,
    this.materialTapTargetSize = MaterialTapTargetSize.padded,
    this.enableFeedback = true,
    this.useMaterial = false,
    this.useCupertino = false,
    this.useCupertinoPro = false,
    this.useFluent = false,
    this.useLinux = false,
    this.useWeb = false,
    this.isFlat = false,
    this.isFilled = false,
    this.isTinted = false,
    this.isIconOnly = false,
  })  : assert(shape != null),
        assert(constraints != null),
        assert(animationDuration != null),
        assert(clipBehavior != null),
        assert(autofocus != null),
        super(
          key: key,
          onPressed: onPressed,
          onLongPress: onLongPress,
          onHover: onHover,
          onFocusChange: onFocusChange,
          style: style,
          focusNode: focusNode,
          autofocus: autofocus,
          clipBehavior: clipBehavior,
          child: child,
        );

  factory NButton.icon({
    Key? key,
    required Icon icon,
    required String label,
    required VoidCallback onPressed,
    VoidCallback? onLongPress,
    ButtonStyle? style,
    FocusNode? focusNode,
    bool? autofocus,
    Clip? clipBehavior,
  }) =>
      NButtonWithIcon(
        key: key,
        onPressed: onPressed,
        onLongPress: onLongPress,
        style: style,
        focusNode: focusNode,
        autofocus: autofocus ?? false,
        clipBehavior: clipBehavior ?? Clip.none,
        icon: icon,
        label: label,
      );

  factory NButton.flat({
    Key? key,
    required Widget child,
    required VoidCallback onPressed,
    VoidCallback? onLongPress,
    ButtonStyle? style,
    FocusNode? focusNode,
    bool? autofocus,
    Clip? clipBehavior,
  }) =>
      NButtonFlat(
        key: key,
        child: child,
        onPressed: onPressed,
        onLongPress: onLongPress,
        style: style,
        focusNode: focusNode,
        autofocus: autofocus ?? false,
        clipBehavior: clipBehavior ?? Clip.none,
      );

  factory NButton.flatWithIcon({
    Key? key,
    required Icon icon,
    required String label,
    required VoidCallback onPressed,
    VoidCallback? onLongPress,
    ButtonStyle? style,
    FocusNode? focusNode,
    bool? autofocus,
    Clip? clipBehavior,
  }) =>
      NButtonFlatWithIcon(
        key: key,
        onPressed: onPressed,
        onLongPress: onLongPress,
        style: style,
        focusNode: focusNode,
        autofocus: autofocus ?? false,
        clipBehavior: clipBehavior ?? Clip.none,
        icon: icon,
        label: label,
      );

  factory NButton.tinted({
    Key? key,
    required Widget child,
    required VoidCallback onPressed,
    VoidCallback? onLongPress,
    ButtonStyle? style,
    FocusNode? focusNode,
    bool? autofocus,
    Clip? clipBehavior,
  }) =>
      NButtonTinted(
        key: key,
        child: child,
        onPressed: onPressed,
        onLongPress: onLongPress,
        style: style,
        focusNode: focusNode,
        autofocus: autofocus ?? false,
        clipBehavior: clipBehavior ?? Clip.none,
      );

  factory NButton.tintedWithIcon({
    Key? key,
    required Icon icon,
    required String label,
    required VoidCallback onPressed,
    VoidCallback? onLongPress,
    ButtonStyle? style,
    FocusNode? focusNode,
    bool? autofocus,
    Clip? clipBehavior,
  }) =>
      NButtonTintedWithIcon(
        key: key,
        onPressed: onPressed,
        onLongPress: onLongPress,
        style: style,
        focusNode: focusNode,
        autofocus: autofocus ?? false,
        clipBehavior: clipBehavior ?? Clip.none,
        icon: icon,
        label: label,
      );

  factory NButton.filled({
    Key? key,
    required Widget child,
    required VoidCallback onPressed,
    VoidCallback? onLongPress,
    ButtonStyle? style,
    FocusNode? focusNode,
    bool? autofocus,
    Clip? clipBehavior,
  }) =>
      NButtonFilled(
        key: key,
        child: child,
        onPressed: onPressed,
        onLongPress: onLongPress,
        style: style,
        focusNode: focusNode,
        autofocus: autofocus ?? false,
        clipBehavior: clipBehavior ?? Clip.none,
      );

  factory NButton.filledWithIcon({
    Key? key,
    required Icon icon,
    required String label,
    required VoidCallback onPressed,
    VoidCallback? onLongPress,
    ButtonStyle? style,
    FocusNode? focusNode,
    bool? autofocus,
    Clip? clipBehavior,
  }) =>
      NButtonFilledWithIcon(
        key: key,
        onPressed: onPressed,
        onLongPress: onLongPress,
        style: style,
        focusNode: focusNode,
        autofocus: autofocus ?? false,
        clipBehavior: clipBehavior ?? Clip.none,
        icon: icon,
        label: label,
      );

  //endregion
  //region properties
  final Widget child;
  final VoidCallback onPressed;
  final VoidCallback? onLongPress;
  final ValueChanged<bool>? onHover;
  final ValueChanged<bool>? onFocusChange;
  final ButtonStyle? style;
  final FocusNode? focusNode;
  final EdgeInsetsGeometry? padding;
  final ValueChanged<bool>? onHighlightChanged;
  final MouseCursor? mouseCursor;
  final MouseCursor? enabledMouseCursor;
  final MouseCursor? hoveredMouseCursor;
  final MouseCursor? disabledMouseCursor;
  final TextStyle? textStyle;
  final Color? fillColor;
  final Color? focusColor;
  final Color? hoverColor;
  final Color? highlightColor;
  final Color? splashColor;
  final Color disabledColor;
  final bool autofocus;
  final Clip clipBehavior;
  final double? minSize;
  final double? pressedOpacity;
  final BorderRadius? borderRadius;
  final AlignmentGeometry alignment;
  final double? elevation;
  final double? hoverElevation;
  final double? focusElevation;
  final double? highlightElevation;
  final double? disabledElevation;
  final VisualDensity visualDensity;
  final BoxConstraints constraints;
  final ShapeBorder shape;
  final Duration animationDuration;
  final MaterialTapTargetSize materialTapTargetSize;
  final bool enableFeedback;
  final bool useMaterial;
  final bool useCupertino;
  final bool useCupertinoPro;
  final bool useFluent;
  final bool useLinux;
  final bool useWeb;
  final bool isFlat;
  final bool isFilled;
  final bool isTinted;
  final bool isIconOnly;
  //endregion
  //region functions
  ButtonStyle styleFrom({
    Color? primary,
    Color? onSurface,
    Color? backgroundColor,
    Color? foregroundColor,
    Color? overlayColor,
    Color? shadowColor,
    double? elevation,
    TextStyle? textStyle,
    EdgeInsetsGeometry? padding,
    Size? minimumSize,
    Size? fixedSize,
    Size? maximumSize,
    BorderSide? side,
    OutlinedBorder? shape,
    MouseCursor? enabledMouseCursor,
    MouseCursor? hoveredMouseCursor,
    MouseCursor? disabledMouseCursor,
    VisualDensity? visualDensity,
    MaterialTapTargetSize? tapTargetSize,
    Duration? animationDuration,
    bool? enableFeedback,
    AlignmentGeometry? alignment,
    InteractiveInkFeatureFactory? splashFactory,
  }) {
    if (padding == null) {
      if (useMaterial) {
        padding ??= _kButtonPadding;
      } else if (useCupertino || useCupertinoPro) {
        padding ??= _kBackgroundButtonPadding;
      } else {
        padding ??= (Platform.isIOS || Platform.isMacOS)
            ? _kBackgroundButtonPadding
            : _kButtonPadding;
      }
    }
    final buttonKind _buttonKind = (isFlat)
        ? buttonKind.flat
        : (isFilled)
            ? buttonKind.filled
            : (isTinted)
                ? buttonKind.tinted
                : buttonKind.outlined;
    final MaterialStateProperty<Color?>? _background =
        _NButtonDefaultBackground(
            backgroundColor, onSurface, _buttonKind, _operatingSystem);
    final MaterialStateProperty<Color?>? _foreground =
        _NButtonDefaultForeground(primary, textStyle?.color, onSurface,
            _buttonKind, _operatingSystem);
    final MaterialStateProperty<Color?>? _overlay = _NButtonDefaultOverlay(
        overlayColor,
        fillColor,
        textStyle?.color ?? onSurface,
        _buttonKind,
        _operatingSystem);
    final MaterialStateProperty<double>? _elevationValue =
        _NButtonDefaultElevation(_operatingSystem);
    final MaterialStateProperty<MouseCursor?>? _mouseCursor =
        _NButtonDefaultMouseCursor(mouseCursor, enabledMouseCursor,
            disabledMouseCursor, hoveredMouseCursor, _operatingSystem);

    MaterialStateProperty<TextStyle?>? _textStyle =
        _NButtonDefaultTextStyle(textStyle, _operatingSystem);

    return ButtonStyle(
      textStyle: _textStyle,
      foregroundColor: _foreground,
      backgroundColor: _background,
      overlayColor: _overlay,
      shadowColor: NButton.allOrNull<Color>(shadowColor),
      elevation: _elevationValue,
      padding: NButton.allOrNull(padding),
      minimumSize: NButton.allOrNull<Size>(minimumSize),
      fixedSize: NButton.allOrNull<Size>(fixedSize),
      maximumSize: NButton.allOrNull<Size>(maximumSize),
      side: NButton.allOrNull<BorderSide>(side),
      shape: NButton.allOrNull<OutlinedBorder>(shape),
      mouseCursor: _mouseCursor,
      visualDensity: visualDensity,
      tapTargetSize: tapTargetSize,
      animationDuration: animationDuration,
      enableFeedback: enableFeedback,
      alignment: alignment,
      splashFactory: splashFactory,
    );
  }

  @override
  ButtonStyle defaultStyleOf(
    BuildContext context,
  ) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;

    final EdgeInsetsGeometry scaledPaddingMaterial =
        ButtonStyleButton.scaledPadding(
      const EdgeInsets.symmetric(horizontal: 16),
      const EdgeInsets.symmetric(horizontal: 8),
      const EdgeInsets.symmetric(horizontal: 4),
      MediaQuery.maybeOf(context)?.textScaleFactor ?? 1,
    );
    final EdgeInsetsGeometry scaledPaddingCupertino =
        ButtonStyleButton.scaledPadding(
      const EdgeInsets.symmetric(horizontal: 64),
      const EdgeInsets.symmetric(horizontal: 32),
      const EdgeInsets.symmetric(horizontal: 16),
      MediaQuery.maybeOf(context)?.textScaleFactor ?? 1,
    );
    final buttonKind _buttonKind = (isFlat)
        ? buttonKind.flat
        : (isFilled)
            ? buttonKind.filled
            : (isTinted)
                ? buttonKind.tinted
                : buttonKind.outlined;

    final scaledPadding = (useMaterial)
        ? scaledPaddingMaterial
        : (useCupertino)
            ? scaledPaddingCupertino
            : Platform.isIOS
                ? scaledPaddingCupertino
                : scaledPaddingMaterial;

    final fontFamily = (useMaterial)
        ? 'Roboto'
        : (useCupertino)
            ? 'SanFrancisco-Compact'
            : (Platform.isIOS)
                ? 'SanFrancisco-Compact'
                : (Platform.isMacOS)
                    ? 'SanFrancisco-Pro'
                    : (Platform.isAndroid)
                        ? 'Roboto'
                        : (Platform.isWindows)
                            ? 'Segoe'
                            : 'Arial';
    Color background = (_buttonKind == buttonKind.filled)
        ? colorScheme.primary
        : (_buttonKind == buttonKind.tinted)
            ? colorScheme.primary.withOpacity(0.1)
            : Colors.transparent;
    Color foreground = (_buttonKind == buttonKind.filled)
        ? colorScheme.onPrimary
        : colorScheme.primary;

    ButtonStyle buttonStyle = styleFrom(
      textStyle: theme.textTheme.button
          ?.copyWith(color: foreground, fontFamily: fontFamily),
      backgroundColor: background,
      foregroundColor: foreground,
      overlayColor: colorScheme.primary.withOpacity(0.2),
      shadowColor: theme.shadowColor,
      elevation: 2,
      padding: scaledPadding,
      minimumSize: const Size(64, 36),
      maximumSize: Size.infinite,
      side: BorderSide(
        color: ThemeData.estimateBrightnessForColor(colorScheme.surface) ==
                Brightness.light
            ? Colors.black12
            : Colors.white12,
        width: 1.0,
        style: BorderStyle.solid,
      ),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(4))),
      enabledMouseCursor: SystemMouseCursors.click,
      disabledMouseCursor: SystemMouseCursors.basic,
      visualDensity: theme.visualDensity,
      tapTargetSize: theme.materialTapTargetSize,
      animationDuration: kThemeChangeDuration,
      enableFeedback: true,
      alignment: Alignment.center,
      splashFactory: InkRipple.splashFactory,
      primary: colorScheme.primary,
      onSurface: colorScheme.onSurface,
    );
    return buttonStyle;
  }

  @override
  ButtonStyle? themeStyleOf(BuildContext context) =>
      OutlinedButtonTheme.of(context).style;

  @override
  bool get enabled => onPressed != null || onLongPress != null;

  static MaterialStateProperty<T>? allOrNull<T>(T? value) =>
      value == null ? null : MaterialStateProperty.all<T>(value);

  static EdgeInsetsGeometry scaledPadding(
    EdgeInsetsGeometry geometry1x,
    EdgeInsetsGeometry geometry2x,
    EdgeInsetsGeometry geometry3x,
    double textScaleFactor,
  ) {
    assert(geometry1x != null);
    assert(geometry2x != null);
    assert(geometry3x != null);
    assert(textScaleFactor != null);

    if (textScaleFactor <= 1) {
      return geometry1x;
    } else if (textScaleFactor >= 3) {
      return geometry3x;
    } else if (textScaleFactor <= 2) {
      return EdgeInsetsGeometry.lerp(
          geometry1x, geometry2x, textScaleFactor - 1)!;
    }
    return EdgeInsetsGeometry.lerp(
        geometry2x, geometry3x, textScaleFactor - 2)!;
  }
//endregion
}

// hovered
// focused
// pressed
// dragged
// selected
// scrolledUnder
// disabled
// error
@immutable
class _NButtonDefaultBackground extends MaterialStateProperty<Color?>
    with Diagnosticable {
  _NButtonDefaultBackground(
      this.fillColor, this.textColor, this.buttonType, this.operatingSystem);

  final Color? fillColor;
  final Color? textColor;
  final buttonKind buttonType;
  final os operatingSystem;

  @override
  Color? resolve(Set<MaterialState> states) {
    if (states.contains(MaterialState.disabled)) {
      return textColor?.withOpacity(0.12);
    }
    Color? btnColor;
    switch (buttonType) {
      case buttonKind.outlined:
        btnColor = Colors.transparent;
        break;
      case buttonKind.flat:
        btnColor = Colors.transparent;
        break;
      case buttonKind.tinted:
        btnColor = fillColor?.withOpacity(0.1);
        break;
      case buttonKind.filled:
        btnColor = fillColor;
        break;
    }
    return btnColor;
  }
}

@immutable
class _NButtonDefaultForeground extends MaterialStateProperty<Color?>
    with Diagnosticable {
  _NButtonDefaultForeground(this.primary, this.onPrimary, this.onSurface,
      this.buttonType, this.operatingSystem);

  final Color? primary;
  final Color? onPrimary;
  final Color? onSurface;
  final buttonKind buttonType;
  final os operatingSystem;

  @override
  Color? resolve(Set<MaterialState> states) {
    if (states.contains(MaterialState.disabled)) {
      return onSurface?.withOpacity(0.38);
    }
    Color? foreground;
    switch (buttonType) {
      case buttonKind.outlined:
        foreground = primary;
        break;
      case buttonKind.flat:
        foreground = primary;
        break;
      case buttonKind.tinted:
        foreground = primary;
        break;
      case buttonKind.filled:
        foreground = onPrimary;
        break;
    }
    return foreground;
  }
}

@immutable
class _NButtonDefaultOverlay extends MaterialStateProperty<Color?>
    with Diagnosticable {
  _NButtonDefaultOverlay(this.overlayColor, this.primary, this.onPrimary,
      this.buttonType, this.operatingSystem);

  final Color? overlayColor;
  final Color? primary;
  final Color? onPrimary;
  final buttonKind buttonType;
  final os operatingSystem;

  @override
  Color? resolve(Set<MaterialState> states) {
    if (states.contains(MaterialState.hovered)) {
      return onPrimary?.withOpacity(0.08);
    }
    if (states.contains(MaterialState.focused) ||
        states.contains(MaterialState.pressed)) {
      return onPrimary?.withOpacity(0.24);
    }
    return overlayColor;
  }
}

@immutable
class _NButtonDefaultElevation extends MaterialStateProperty<double>
    with Diagnosticable {
  _NButtonDefaultElevation(this.buttonType);

  final double elevation = 2.0;
  final os buttonType;

  @override
  double resolve(Set<MaterialState> states) {
    if (states.contains(MaterialState.disabled)) {
      return 0.0;
    }
    if (states.contains(MaterialState.hovered)) {
      return elevation + 2.0;
    }
    if (states.contains(MaterialState.focused)) {
      return elevation + 2.0;
    }
    if (states.contains(MaterialState.pressed)) {
      return elevation + 6.0;
    }
    return elevation;
  }
}

@immutable
class _NButtonDefaultMouseCursor extends MaterialStateProperty<MouseCursor?>
    with Diagnosticable {
  _NButtonDefaultMouseCursor(this.mouseCursor, this.enabledCursor,
      this.disabledCursor, this.hoveredCursor, this.operatingSystem);

  final MouseCursor? mouseCursor;
  final MouseCursor? enabledCursor;
  final MouseCursor? disabledCursor;
  final MouseCursor? hoveredCursor;
  final os operatingSystem;

  @override
  MouseCursor resolve(Set<MaterialState> states) => (mouseCursor == null)
      ? (states.contains(MaterialState.disabled))
          ? (disabledCursor ?? SystemMouseCursors.forbidden)
          : (states.contains(MaterialState.hovered))
              ? (hoveredCursor ?? SystemMouseCursors.basic)
              : (enabledCursor ?? SystemMouseCursors.click)
      : mouseCursor!;
}

@immutable
class _NButtonDefaultTextStyle extends MaterialStateProperty<TextStyle?>
    with Diagnosticable {
  _NButtonDefaultTextStyle(this.textStyle, this.operatingSystem);
  final TextStyle? textStyle;
  final os operatingSystem;

  @override
  TextStyle resolve(Set<MaterialState> states) {
    if (textStyle != null) {
      return textStyle!;
    } else {
      var font = 'Arial';
      var size = 12.0;
      switch (operatingSystem) {
        case os.web:
          font = '';
          break;
        case os.android:
          font = 'Roboto';
          break;
        case os.ios:
          font = 'SanFrancisco-Compact';
          break;
        case os.mac:
          font = 'SanFrancisco-Pro';
          break;
        case os.windows:
          font = 'Segoe';
          break;
        case os.linux:
          font = 'Segoe';
          break;
      }
      return TextStyle(fontFamily: font, fontSize: size);
    }
  }
}

class NButtonWithIcon extends NButton {
  NButtonWithIcon({
    Key? key,
    required VoidCallback onPressed,
    required Icon icon,
    required String label,
    VoidCallback? onLongPress,
    ValueChanged<bool>? onHover,
    ValueChanged<bool>? onFocusChange,
    ButtonStyle? style,
    FocusNode? focusNode,
    EdgeInsetsGeometry? padding,
    double? pressedOpacity,
    ValueChanged<bool>? onHighlightChanged,
    MouseCursor? mouseCursor,
    TextStyle? textStyle,
    Color? fillColor,
    Color? focusColor,
    Color? hoverColor,
    Color? highlightColor,
    Color? splashColor,
    Color disabledColor = CupertinoColors.quaternarySystemFill,
    bool autofocus = false,
    Clip clipBehavior = Clip.none,
    AlignmentGeometry alignment = Alignment.center,
    double minSize = kMinInteractiveDimensionCupertino,
    BorderRadius borderRadius = const BorderRadius.all(Radius.circular(8.0)),
    double elevation = 2.0,
    double hoverElevation = 4.0,
    double focusElevation = 4.0,
    double highlightElevation = 8.0,
    double disabledElevation = 0.0,
    VisualDensity visualDensity = VisualDensity.standard,
    BoxConstraints constraints =
        const BoxConstraints(minWidth: 88.0, minHeight: 36.0),
    ShapeBorder shape = const RoundedRectangleBorder(
      side: BorderSide(color: CupertinoColors.inactiveGray),
      borderRadius: BorderRadius.all(Radius.circular(8.0)),
    ),
    Duration animationDuration = kThemeChangeDuration,
    MaterialTapTargetSize materialTapTargetSize = MaterialTapTargetSize.padded,
    bool enableFeedback = true,
    bool useMaterial = false,
    bool useCupertino = false,
    bool isFlat = false,
    bool isFilled = false,
    bool isTinted = false,
  })  : assert(icon != null),
        assert(label != null),
        super(
          key: key,
          child: _NButtonWithIconChild(icon: icon, label: Text(label)),
          onPressed: onPressed,
          onLongPress: onLongPress,
          onHover: onHover,
          onFocusChange: onFocusChange,
          style: style,
          focusNode: focusNode,
          padding: padding,
          onHighlightChanged: onHighlightChanged,
          mouseCursor: mouseCursor,
          textStyle: textStyle,
          fillColor: fillColor,
          focusColor: focusColor,
          hoverColor: hoverColor,
          highlightColor: highlightColor,
          splashColor: splashColor,
          disabledColor: disabledColor,
          autofocus: autofocus,
          clipBehavior: clipBehavior,
          minSize: minSize,
          pressedOpacity: pressedOpacity,
          borderRadius: borderRadius,
          alignment: alignment,
          elevation: elevation,
          hoverElevation: hoverElevation,
          focusElevation: focusElevation,
          highlightElevation: highlightElevation,
          disabledElevation: disabledElevation,
          visualDensity: visualDensity,
          constraints: constraints,
          shape: shape,
          animationDuration: animationDuration,
          materialTapTargetSize: materialTapTargetSize,
          enableFeedback: enableFeedback,
          useMaterial: useMaterial,
          useCupertino: useCupertino,
          isFlat: isFlat,
          isFilled: isFilled,
          isTinted: isTinted,
        );
}

class NButtonFlat extends NButton {
  //region constructor
  const NButtonFlat({
    Key? key,
    required Widget child,
    required VoidCallback onPressed,
    VoidCallback? onLongPress,
    ValueChanged<bool>? onHover,
    ValueChanged<bool>? onFocusChange,
    ButtonStyle? style,
    FocusNode? focusNode,
    EdgeInsetsGeometry? padding,
    ValueChanged<bool>? onHighlightChanged,
    double? pressedOpacity,
    MouseCursor? mouseCursor,
    TextStyle? textStyle,
    Color? fillColor,
    Color? focusColor,
    Color? hoverColor,
    Color? highlightColor,
    Color? splashColor,
    Color disabledColor = CupertinoColors.quaternarySystemFill,
    bool autofocus = false,
    Clip clipBehavior = Clip.none,
    double? minSize = kMinInteractiveDimensionCupertino,
    BorderRadius? borderRadius = const BorderRadius.all(Radius.circular(8.0)),
    AlignmentGeometry alignment = Alignment.center,
    double elevation = 2.0,
    double hoverElevation = 4.0,
    double focusElevation = 4.0,
    double highlightElevation = 8.0,
    double disabledElevation = 0.0,
    VisualDensity visualDensity = VisualDensity.standard,
    BoxConstraints constraints =
        const BoxConstraints(minWidth: 88.0, minHeight: 36.0),
    ShapeBorder shape = const RoundedRectangleBorder(),
    Duration animationDuration = kThemeChangeDuration,
    MaterialTapTargetSize materialTapTargetSize = MaterialTapTargetSize.padded,
    bool enableFeedback = true,
    bool useMaterial = false,
    bool useCupertino = false,
  }) : super(
          key: key,
          child: child,
          onPressed: onPressed,
          onLongPress: onLongPress,
          onHover: onHover,
          onFocusChange: onFocusChange,
          style: style,
          focusNode: focusNode,
          padding: padding,
          onHighlightChanged: onHighlightChanged,
          mouseCursor: mouseCursor,
          textStyle: textStyle,
          fillColor: fillColor,
          focusColor: focusColor,
          hoverColor: hoverColor,
          highlightColor: highlightColor,
          splashColor: splashColor,
          disabledColor: disabledColor,
          autofocus: autofocus,
          clipBehavior: clipBehavior,
          minSize: minSize,
          pressedOpacity: pressedOpacity,
          borderRadius: borderRadius,
          alignment: alignment,
          elevation: elevation,
          hoverElevation: hoverElevation,
          focusElevation: focusElevation,
          highlightElevation: highlightElevation,
          disabledElevation: disabledElevation,
          visualDensity: visualDensity,
          constraints: constraints,
          shape: shape,
          animationDuration: animationDuration,
          materialTapTargetSize: materialTapTargetSize,
          enableFeedback: enableFeedback,
          useMaterial: useMaterial,
          useCupertino: useCupertino,
          isFlat: true,
        );
  //endregion

  @override
  ButtonStyle defaultStyleOf(
    BuildContext context,
  ) {
    return super.defaultStyleOf(context).copyWith(
        backgroundColor: null,
        side: NButton.allOrNull(const BorderSide(color: Colors.transparent)));
  }
}

class NButtonFlatWithIcon extends NButtonFlat {
  NButtonFlatWithIcon({
    Key? key,
    required VoidCallback onPressed,
    required Icon icon,
    required String label,
    VoidCallback? onLongPress,
    ValueChanged<bool>? onHover,
    ValueChanged<bool>? onFocusChange,
    ButtonStyle? style,
    FocusNode? focusNode,
    EdgeInsetsGeometry? padding,
    double? pressedOpacity,
    ValueChanged<bool>? onHighlightChanged,
    MouseCursor? mouseCursor,
    TextStyle? textStyle,
    Color? fillColor,
    Color? focusColor,
    Color? hoverColor,
    Color? highlightColor,
    Color? splashColor,
    Color disabledColor = CupertinoColors.quaternarySystemFill,
    bool autofocus = false,
    Clip clipBehavior = Clip.none,
    AlignmentGeometry alignment = Alignment.center,
    double? minSize = kMinInteractiveDimensionCupertino,
    BorderRadius? borderRadius = const BorderRadius.all(Radius.circular(8.0)),
    double elevation = 2.0,
    double hoverElevation = 4.0,
    double focusElevation = 4.0,
    double highlightElevation = 8.0,
    double disabledElevation = 0.0,
    VisualDensity visualDensity = VisualDensity.standard,
    BoxConstraints constraints =
        const BoxConstraints(minWidth: 88.0, minHeight: 36.0),
    ShapeBorder shape = const RoundedRectangleBorder(),
    Duration animationDuration = kThemeChangeDuration,
    MaterialTapTargetSize materialTapTargetSize = MaterialTapTargetSize.padded,
    bool enableFeedback = true,
    bool useMaterial = false,
    bool useCupertino = false,
  }) : super(
          key: key,
          child: _NButtonWithIconChild(icon: icon, label: Text(label)),
          onPressed: onPressed,
          onLongPress: onLongPress,
          onHover: onHover,
          onFocusChange: onFocusChange,
          style: style,
          focusNode: focusNode,
          padding: padding,
          onHighlightChanged: onHighlightChanged,
          mouseCursor: mouseCursor,
          textStyle: textStyle,
          fillColor: fillColor,
          focusColor: focusColor,
          hoverColor: hoverColor,
          highlightColor: highlightColor,
          splashColor: splashColor,
          disabledColor: disabledColor,
          autofocus: autofocus,
          clipBehavior: clipBehavior,
          minSize: minSize,
          pressedOpacity: pressedOpacity,
          borderRadius: borderRadius,
          alignment: alignment,
          elevation: elevation,
          hoverElevation: hoverElevation,
          focusElevation: focusElevation,
          highlightElevation: highlightElevation,
          disabledElevation: disabledElevation,
          visualDensity: visualDensity,
          constraints: constraints,
          shape: shape,
          animationDuration: animationDuration,
          materialTapTargetSize: materialTapTargetSize,
          enableFeedback: enableFeedback,
          useMaterial: useMaterial,
          useCupertino: useCupertino,
        );
}

class NButtonTinted extends NButton {
  //region constructor
  const NButtonTinted({
    Key? key,
    required Widget child,
    required VoidCallback onPressed,
    VoidCallback? onLongPress,
    ValueChanged<bool>? onHover,
    ValueChanged<bool>? onFocusChange,
    ButtonStyle? style,
    FocusNode? focusNode,
    EdgeInsetsGeometry? padding,
    ValueChanged<bool>? onHighlightChanged,
    double? pressedOpacity,
    MouseCursor? mouseCursor,
    TextStyle? textStyle,
    Color? fillColor,
    Color? focusColor,
    Color? hoverColor,
    Color? highlightColor,
    Color? splashColor,
    Color disabledColor = CupertinoColors.quaternarySystemFill,
    bool autofocus = false,
    Clip clipBehavior = Clip.none,
    double? minSize = kMinInteractiveDimensionCupertino,
    BorderRadius? borderRadius = const BorderRadius.all(Radius.circular(8.0)),
    AlignmentGeometry alignment = Alignment.center,
    double elevation = 2.0,
    double hoverElevation = 4.0,
    double focusElevation = 4.0,
    double highlightElevation = 8.0,
    double disabledElevation = 0.0,
    VisualDensity visualDensity = VisualDensity.standard,
    BoxConstraints constraints =
        const BoxConstraints(minWidth: 88.0, minHeight: 36.0),
    ShapeBorder shape = const RoundedRectangleBorder(),
    Duration animationDuration = kThemeChangeDuration,
    MaterialTapTargetSize materialTapTargetSize = MaterialTapTargetSize.padded,
    bool enableFeedback = true,
    bool useMaterial = false,
    bool useCupertino = false,
  }) : super(
          key: key,
          child: child,
          onPressed: onPressed,
          onLongPress: onLongPress,
          onHover: onHover,
          onFocusChange: onFocusChange,
          style: style,
          focusNode: focusNode,
          padding: padding,
          onHighlightChanged: onHighlightChanged,
          mouseCursor: mouseCursor,
          textStyle: textStyle,
          fillColor: fillColor,
          focusColor: focusColor,
          hoverColor: hoverColor,
          highlightColor: highlightColor,
          splashColor: splashColor,
          disabledColor: disabledColor,
          autofocus: autofocus,
          clipBehavior: clipBehavior,
          minSize: minSize,
          pressedOpacity: pressedOpacity,
          borderRadius: borderRadius,
          alignment: alignment,
          elevation: elevation,
          hoverElevation: hoverElevation,
          focusElevation: focusElevation,
          highlightElevation: highlightElevation,
          disabledElevation: disabledElevation,
          visualDensity: visualDensity,
          constraints: constraints,
          shape: shape,
          animationDuration: animationDuration,
          materialTapTargetSize: materialTapTargetSize,
          enableFeedback: enableFeedback,
          useMaterial: useMaterial,
          useCupertino: useCupertino,
          isTinted: true,
        );
  //endregion

  @override
  ButtonStyle defaultStyleOf(
    BuildContext context,
  ) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;

    return super.defaultStyleOf(context).copyWith(
        shadowColor: NButton.allOrNull(Colors.transparent),
        backgroundColor:
            NButton.allOrNull(colorScheme.primary.withOpacity(0.1)));
  }
}

class NButtonTintedWithIcon extends NButtonTinted {
  NButtonTintedWithIcon({
    Key? key,
    required VoidCallback onPressed,
    required Icon icon,
    required String label,
    VoidCallback? onLongPress,
    ValueChanged<bool>? onHover,
    ValueChanged<bool>? onFocusChange,
    ButtonStyle? style,
    FocusNode? focusNode,
    EdgeInsetsGeometry? padding,
    double? pressedOpacity,
    ValueChanged<bool>? onHighlightChanged,
    MouseCursor? mouseCursor,
    TextStyle? textStyle,
    Color? fillColor,
    Color? focusColor,
    Color? hoverColor,
    Color? highlightColor,
    Color? splashColor,
    Color disabledColor = CupertinoColors.quaternarySystemFill,
    bool autofocus = false,
    Clip clipBehavior = Clip.none,
    AlignmentGeometry alignment = Alignment.center,
    double? minSize = kMinInteractiveDimensionCupertino,
    BorderRadius? borderRadius = const BorderRadius.all(Radius.circular(8.0)),
    double elevation = 2.0,
    double hoverElevation = 4.0,
    double focusElevation = 4.0,
    double highlightElevation = 8.0,
    double disabledElevation = 0.0,
    VisualDensity visualDensity = VisualDensity.standard,
    BoxConstraints constraints =
        const BoxConstraints(minWidth: 88.0, minHeight: 36.0),
    ShapeBorder shape = const RoundedRectangleBorder(),
    Duration animationDuration = kThemeChangeDuration,
    MaterialTapTargetSize materialTapTargetSize = MaterialTapTargetSize.padded,
    bool enableFeedback = true,
    bool useMaterial = false,
    bool useCupertino = false,
  }) : super(
          key: key,
          child: _NButtonWithIconChild(icon: icon, label: Text(label)),
          onPressed: onPressed,
          onLongPress: onLongPress,
          onHover: onHover,
          onFocusChange: onFocusChange,
          style: style,
          focusNode: focusNode,
          padding: padding,
          onHighlightChanged: onHighlightChanged,
          mouseCursor: mouseCursor,
          textStyle: textStyle,
          fillColor: fillColor,
          focusColor: focusColor,
          hoverColor: hoverColor,
          highlightColor: highlightColor,
          splashColor: splashColor,
          disabledColor: disabledColor,
          autofocus: autofocus,
          clipBehavior: clipBehavior,
          minSize: minSize,
          pressedOpacity: pressedOpacity,
          borderRadius: borderRadius,
          alignment: alignment,
          elevation: elevation,
          hoverElevation: hoverElevation,
          focusElevation: focusElevation,
          highlightElevation: highlightElevation,
          disabledElevation: disabledElevation,
          visualDensity: visualDensity,
          constraints: constraints,
          shape: shape,
          animationDuration: animationDuration,
          materialTapTargetSize: materialTapTargetSize,
          enableFeedback: enableFeedback,
          useMaterial: useMaterial,
          useCupertino: useCupertino,
        );
}

class NButtonFilled extends NButton {
  //region constructor
  const NButtonFilled({
    Key? key,
    required Widget child,
    required VoidCallback onPressed,
    VoidCallback? onLongPress,
    ValueChanged<bool>? onHover,
    ValueChanged<bool>? onFocusChange,
    ButtonStyle? style,
    FocusNode? focusNode,
    EdgeInsetsGeometry? padding,
    ValueChanged<bool>? onHighlightChanged,
    double? pressedOpacity,
    MouseCursor? mouseCursor,
    TextStyle? textStyle,
    Color? fillColor,
    Color? focusColor,
    Color? hoverColor,
    Color? highlightColor,
    Color? splashColor,
    Color disabledColor = CupertinoColors.quaternarySystemFill,
    bool autofocus = false,
    Clip clipBehavior = Clip.none,
    double? minSize = kMinInteractiveDimensionCupertino,
    BorderRadius? borderRadius = const BorderRadius.all(Radius.circular(8.0)),
    AlignmentGeometry alignment = Alignment.center,
    double elevation = 2.0,
    double hoverElevation = 4.0,
    double focusElevation = 4.0,
    double highlightElevation = 8.0,
    double disabledElevation = 0.0,
    VisualDensity visualDensity = VisualDensity.standard,
    BoxConstraints constraints =
        const BoxConstraints(minWidth: 88.0, minHeight: 36.0),
    ShapeBorder shape = const RoundedRectangleBorder(),
    Duration animationDuration = kThemeChangeDuration,
    MaterialTapTargetSize materialTapTargetSize = MaterialTapTargetSize.padded,
    bool enableFeedback = true,
    bool useMaterial = false,
    bool useCupertino = false,
  }) : super(
          key: key,
          child: child,
          onPressed: onPressed,
          onLongPress: onLongPress,
          onHover: onHover,
          onFocusChange: onFocusChange,
          style: style,
          focusNode: focusNode,
          padding: padding,
          onHighlightChanged: onHighlightChanged,
          mouseCursor: mouseCursor,
          textStyle: textStyle,
          fillColor: fillColor,
          focusColor: focusColor,
          hoverColor: hoverColor,
          highlightColor: highlightColor,
          splashColor: splashColor,
          disabledColor: disabledColor,
          autofocus: autofocus,
          clipBehavior: clipBehavior,
          minSize: minSize,
          pressedOpacity: pressedOpacity,
          borderRadius: borderRadius,
          alignment: alignment,
          elevation: elevation,
          hoverElevation: hoverElevation,
          focusElevation: focusElevation,
          highlightElevation: highlightElevation,
          disabledElevation: disabledElevation,
          visualDensity: visualDensity,
          constraints: constraints,
          shape: shape,
          animationDuration: animationDuration,
          materialTapTargetSize: materialTapTargetSize,
          enableFeedback: enableFeedback,
          useMaterial: useMaterial,
          useCupertino: useCupertino,
          isFilled: true,
        );
  //endregion

  @override
  ButtonStyle defaultStyleOf(
    BuildContext context,
  ) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;

    return super.defaultStyleOf(context).copyWith(
        textStyle: NButton.allOrNull(TextStyle(color: colorScheme.onPrimary)),
        foregroundColor: NButton.allOrNull(colorScheme.onPrimary),
        backgroundColor: NButton.allOrNull(colorScheme.primary));
  }
}

class NButtonFilledWithIcon extends NButtonFilled {
  NButtonFilledWithIcon({
    Key? key,
    required VoidCallback onPressed,
    required Icon icon,
    required String label,
    VoidCallback? onLongPress,
    ValueChanged<bool>? onHover,
    ValueChanged<bool>? onFocusChange,
    ButtonStyle? style,
    FocusNode? focusNode,
    EdgeInsetsGeometry? padding,
    double? pressedOpacity,
    ValueChanged<bool>? onHighlightChanged,
    MouseCursor? mouseCursor,
    TextStyle? textStyle,
    Color? fillColor,
    Color? focusColor,
    Color? hoverColor,
    Color? highlightColor,
    Color? splashColor,
    Color disabledColor = CupertinoColors.quaternarySystemFill,
    bool autofocus = false,
    Clip clipBehavior = Clip.none,
    AlignmentGeometry alignment = Alignment.center,
    double? minSize = kMinInteractiveDimensionCupertino,
    BorderRadius? borderRadius = const BorderRadius.all(Radius.circular(8.0)),
    double elevation = 2.0,
    double hoverElevation = 4.0,
    double focusElevation = 4.0,
    double highlightElevation = 8.0,
    double disabledElevation = 0.0,
    VisualDensity visualDensity = VisualDensity.standard,
    BoxConstraints constraints =
        const BoxConstraints(minWidth: 88.0, minHeight: 36.0),
    ShapeBorder shape = const RoundedRectangleBorder(),
    Duration animationDuration = kThemeChangeDuration,
    MaterialTapTargetSize materialTapTargetSize = MaterialTapTargetSize.padded,
    bool enableFeedback = true,
    bool useMaterial = false,
    bool useCupertino = false,
  }) : super(
          key: key,
          child: _NButtonWithIconChild(icon: icon, label: Text(label)),
          onPressed: onPressed,
          onLongPress: onLongPress,
          onHover: onHover,
          onFocusChange: onFocusChange,
          style: style,
          focusNode: focusNode,
          padding: padding,
          onHighlightChanged: onHighlightChanged,
          mouseCursor: mouseCursor,
          textStyle: textStyle,
          fillColor: fillColor,
          focusColor: focusColor,
          hoverColor: hoverColor,
          highlightColor: highlightColor,
          splashColor: splashColor,
          disabledColor: disabledColor,
          autofocus: autofocus,
          clipBehavior: clipBehavior,
          minSize: minSize,
          pressedOpacity: pressedOpacity,
          borderRadius: borderRadius,
          alignment: alignment,
          elevation: elevation,
          hoverElevation: hoverElevation,
          focusElevation: focusElevation,
          highlightElevation: highlightElevation,
          disabledElevation: disabledElevation,
          visualDensity: visualDensity,
          constraints: constraints,
          shape: shape,
          animationDuration: animationDuration,
          materialTapTargetSize: materialTapTargetSize,
          enableFeedback: enableFeedback,
          useMaterial: useMaterial,
          useCupertino: useCupertino,
        );
}

class _NButtonWithIconChild extends StatelessWidget {
  const _NButtonWithIconChild({
    Key? key,
    required this.label,
    required this.icon,
  }) : super(key: key);

  final Widget label;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    final double scale = MediaQuery.maybeOf(context)?.textScaleFactor ?? 1;
    final double gap =
        scale <= 1 ? 8 : lerpDouble(8, 4, math.min(scale - 1, 1))!;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[icon, SizedBox(width: gap), Flexible(child: label)],
    );
  }
}

/*
              __________________________________________
    This Set  ||  flat   |NButton|tinted   |  filled    ||
              __________________________________________
    Cupertino || plain  | grey  | tinted  | filled     ||
    Material  || text   | toggle| outlined| contained ||
              ==========================================
 */
enum buttonKind { flat, outlined, tinted, filled }
