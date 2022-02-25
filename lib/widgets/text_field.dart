import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter/services.dart';

import '../enums.dart';

String fontFamily(OS operatingSystem) => (operatingSystem == OS.android)
    ? 'Roboto'
    : (operatingSystem == OS.windows)
        ? 'Segoe'
        : (operatingSystem == OS.ios)
            ? 'SanFrancisco-Compact'
            : (operatingSystem == OS.mac)
                ? 'SanFrancisco-Pro'
                : (operatingSystem == OS.linux)
                    ? 'Cantarell'
                    : 'Arial';

class NTextField extends StatefulWidget {
  //region Constructor
  const NTextField({
    Key? key,
    this.controller,
    this.initialValue,
    this.focusNode,
    this.keyboardType,
    this.textCapitalization = TextCapitalization.none,
    this.textInputAction,
    this.style,
    this.strutStyle,
    this.textDirection = TextDirection.ltr,
    this.textAlign = TextAlign.start,
    this.textAlignVertical = TextAlignVertical.center,
    this.autofocus = false,
    this.readOnly = false,
    this.toolbarOptions,
    this.showCursor,
    this.obscuringCharacter = '•',
    this.obscureText = false,
    this.autocorrect = true,
    this.smartDashesType,
    this.smartQuotesType,
    this.enableSuggestions = true,
    this.maxLengthEnforcement,
    this.maxLines = 1,
    this.minLines,
    this.expands = false,
    this.maxLength,
    this.onChanged,
    this.onTap,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.onSaved,
    this.validator,
    this.inputFormatters,
    this.enabled = true,
    this.cursorWidth = 2.0,
    this.cursorHeight,
    this.cursorRadius = const Radius.circular(2.0),
    this.cursorColor,
    this.keyboardAppearance,
    this.scrollPadding = const EdgeInsets.all(10.0),
    this.enableInteractiveSelection = true,
    this.selectionControls,
    this.buildCounter,
    this.scrollPhysics,
    this.autofillHints,
    this.autovalidateMode = AutovalidateMode.disabled,
    this.scrollController,
    this.restorationId,
    this.enableIMEPersonalizedLearning = true,
    this.icon,
    this.iconColor,
    this.prefixIcon,
    this.prefixIconColor,
    this.labelText,
    this.labelStyle,
    this.floatingLabelStyle,
    this.hintText, //placeholder
    this.hintStyle = const TextStyle(
      fontWeight: FontWeight.w400,
      color: CupertinoColors.placeholderText,
    ), //
    this.hintTextDirection,
    this.hintMaxLines,
    this.helperText,
    this.helperStyle,
    this.helperMaxLines,
    this.errorText,
    this.errorStyle,
    this.errorMaxLines,
    this.floatingLabelBehavior,
    this.isDense = true,
    this.contentPadding = const EdgeInsets.all(0),
    this.isCollapsed = false,
    this.suffixIcon,
    this.suffixText,
    this.suffixStyle,
    this.suffixIconColor,
    this.counterText,
    this.counterStyle,
    this.filled,
    this.fillColor,
    this.focusColor,
    this.hoverColor,
    this.errorBorder,
    this.focusedBorder,
    this.focusedErrorBorder,
    this.disabledBorder,
    this.enabledBorder,
    this.semanticCounterText,
    this.alignLabelWithHint,
    this.constraints = const BoxConstraints(maxHeight: 44),
    this.useMaterial = false,
    this.useCupertino = false,
    this.useCupertinoPro = false,
    this.useFluent = false,
    this.useLinux = false,
    this.useWeb = false,
    this.isOutlined = false,
  })  : assert(!(suffixIcon != null && suffixText != null),
            'Declaring both suffix and suffixText is not supported.'),
        assert(initialValue == null || controller == null),
        assert(obscuringCharacter.length == 1),
        assert(maxLines == null || maxLines > 0),
        assert(minLines == null || minLines > 0),
        assert(
          (maxLines == null) || (minLines == null) || (maxLines >= minLines),
          "minLines can't be greater than maxLines",
        ),
        assert(
          !expands || (maxLines == null && minLines == null),
          'minLines and maxLines must be null when expands is true.',
        ),
        assert(!obscureText || maxLines == 1,
            'Obscured fields cannot be multiline.'),
        assert(maxLength == null ||
            maxLength == TextField.noMaxLength ||
            maxLength > 0),
        super(key: key);
  //endregion
  //region properties
  final TextEditingController? controller;
  final String? initialValue;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final TextCapitalization textCapitalization;
  final TextInputAction? textInputAction;
  final TextStyle? style;
  final StrutStyle? strutStyle;
  final TextDirection? textDirection;
  final TextAlign textAlign;
  final TextAlignVertical? textAlignVertical;
  final bool autofocus;
  final bool readOnly;
  final ToolbarOptions? toolbarOptions;
  final bool? showCursor;
  final String obscuringCharacter;
  final bool obscureText;
  final bool autocorrect;
  final SmartDashesType? smartDashesType;
  final SmartQuotesType? smartQuotesType;
  final bool enableSuggestions;
  final MaxLengthEnforcement? maxLengthEnforcement;
  final int? maxLines;
  final int? minLines;
  final bool expands;
  final int? maxLength;
  final ValueChanged<String>? onChanged;
  final GestureTapCallback? onTap;
  final VoidCallback? onEditingComplete;
  final ValueChanged<String>? onFieldSubmitted;
  final FormFieldSetter<String>? onSaved;
  final FormFieldValidator<String>? validator;
  final List<TextInputFormatter>? inputFormatters;
  final bool enabled;
  final double cursorWidth;
  final double? cursorHeight;
  final Radius cursorRadius;
  final Color? cursorColor;
  final Brightness? keyboardAppearance;
  final EdgeInsets scrollPadding;
  final bool enableInteractiveSelection;
  final TextSelectionControls? selectionControls;
  final InputCounterWidgetBuilder? buildCounter;
  final ScrollPhysics? scrollPhysics;
  final Iterable<String>? autofillHints;
  final AutovalidateMode autovalidateMode;
  final ScrollController? scrollController;
  final String? restorationId;
  final bool enableIMEPersonalizedLearning;
  final IconData? icon;
  final Color? iconColor;
  final IconData? prefixIcon;
  final Color? prefixIconColor;
  final String? labelText;
  final TextStyle? labelStyle;
  final TextStyle? floatingLabelStyle;
  final String? hintText;
  final TextStyle? hintStyle;
  final TextDirection? hintTextDirection;
  final int? hintMaxLines;
  final String? helperText;
  final TextStyle? helperStyle;
  final int? helperMaxLines;
  final String? errorText;
  final TextStyle? errorStyle;
  final int? errorMaxLines;
  final FloatingLabelBehavior? floatingLabelBehavior;
  final bool? isDense;
  final EdgeInsetsGeometry? contentPadding;
  final bool isCollapsed;
  final IconData? suffixIcon;
  final String? suffixText;
  final TextStyle? suffixStyle;
  final Color? suffixIconColor;
  final String? counterText;
  final TextStyle? counterStyle;
  final bool? filled;
  final Color? fillColor;
  final Color? focusColor;
  final Color? hoverColor;
  final InputBorder? errorBorder;
  final InputBorder? focusedBorder;
  final InputBorder? focusedErrorBorder;
  final InputBorder? disabledBorder;
  final InputBorder? enabledBorder;
  final String? semanticCounterText;
  final bool? alignLabelWithHint;
  final BoxConstraints? constraints;
  final bool useMaterial;
  final bool useCupertino;
  final bool useCupertinoPro;
  final bool useFluent;
  final bool useLinux;
  final bool useWeb;
  final bool isOutlined;
  //endregion
  // region Functions
  factory NTextField.outlined({
    Key? key,
    TextEditingController? controller,
    String? initialValue,
    FocusNode? focusNode,
    TextInputType? keyboardType,
    TextCapitalization textCapitalization = TextCapitalization.none,
    TextInputAction? textInputAction,
    TextStyle? style,
    bool autofocus = false,
    bool readOnly = false,
    ToolbarOptions? toolbarOptions,
    bool? showCursor,
    SmartDashesType? smartDashesType,
    SmartQuotesType? smartQuotesType,
    MaxLengthEnforcement? maxLengthEnforcement,
    int maxLines = 1,
    int? minLines,
    int? maxLength,
    ValueChanged<String>? onChanged,
    GestureTapCallback? onTap,
    VoidCallback? onEditingComplete,
    ValueChanged<String>? onFieldSubmitted,
    FormFieldSetter<String>? onSaved,
    FormFieldValidator<String>? validator,
    List<TextInputFormatter>? inputFormatters,
    bool enabled = true,
    Color? cursorColor,
    Brightness? keyboardAppearance,
    TextSelectionControls? selectionControls,
    InputCounterWidgetBuilder? buildCounter,
    ScrollPhysics? scrollPhysics,
    Iterable<String>? autofillHints,
    AutovalidateMode autovalidateMode = AutovalidateMode.disabled,
    ScrollController? scrollController,
    IconData? icon,
    Color? iconColor,
    IconData? prefixIcon,
    Color? prefixIconColor,
    String? labelText,
    TextStyle? labelStyle,
    TextStyle? floatingLabelStyle,
    String? hintText, //placeholder
    String? helperText,
    TextStyle? helperStyle,
    int? helperMaxLines,
    String? errorText,
    TextStyle? errorStyle,
    int? errorMaxLines,
    FloatingLabelBehavior? floatingLabelBehavior,
    bool? isDense,
    EdgeInsetsGeometry? contentPadding,
    String? suffixText,
    IconData? suffixIcon,
    String? counterText,
    Widget? counter,
    TextStyle? counterStyle,
    bool? filled,
    Color? fillColor,
    Color? focusColor,
    Color? hoverColor,
    String? semanticCounterText,
    bool? alignLabelWithHint,
    BoxConstraints? constraints,
    bool useMaterial = false,
    bool useCupertino = false,
    bool useCupertinoPro = false,
    bool useFluent = false,
    bool useLinux = false,
    bool useWeb = false,
  }) =>
      NTextFieldOutlined(
        key: key,
        controller: controller,
        initialValue: initialValue,
        focusNode: focusNode,
        keyboardType: keyboardType,
        textCapitalization: textCapitalization,
        textInputAction: textInputAction,
        style: style,
        autofocus: autofocus,
        readOnly: readOnly,
        toolbarOptions: toolbarOptions,
        showCursor: showCursor,
        smartDashesType: smartDashesType,
        smartQuotesType: smartQuotesType,
        maxLengthEnforcement: maxLengthEnforcement,
        minLines: minLines,
        maxLength: maxLength,
        onChanged: onChanged,
        onTap: onTap,
        onEditingComplete: onEditingComplete,
        onFieldSubmitted: onFieldSubmitted,
        onSaved: onSaved,
        validator: validator,
        inputFormatters: inputFormatters,
        enabled: enabled,
        cursorColor: cursorColor,
        keyboardAppearance: keyboardAppearance,
        selectionControls: selectionControls,
        buildCounter: buildCounter,
        scrollPhysics: scrollPhysics,
        autofillHints: autofillHints,
        autovalidateMode: autovalidateMode,
        scrollController: scrollController,
        icon: icon,
        iconColor: iconColor,
        prefixIcon: prefixIcon,
        prefixIconColor: prefixIconColor,
        labelText: labelText,
        labelStyle: labelStyle,
        floatingLabelStyle: floatingLabelStyle,
        hintText: hintText,
        helperText: helperText,
        helperStyle: helperStyle,
        helperMaxLines: helperMaxLines,
        errorText: errorText,
        errorStyle: errorStyle,
        errorMaxLines: errorMaxLines,
        floatingLabelBehavior: floatingLabelBehavior,
        isDense: isDense,
        contentPadding: contentPadding,
        suffixText: suffixText,
        suffixIcon: suffixIcon,
        counterText: counterText,
        counter: counter,
        counterStyle: counterStyle,
        filled: filled,
        fillColor: fillColor,
        focusColor: focusColor,
        hoverColor: hoverColor,
        semanticCounterText: semanticCounterText,
        alignLabelWithHint: alignLabelWithHint,
        constraints: constraints,
        useMaterial: useMaterial,
        useCupertino: useCupertino,
        useCupertinoPro: useCupertinoPro,
        useFluent: useFluent,
        useLinux: useLinux,
        useWeb: useWeb,
      );
  // endregion

  @override
  _NTextFieldState createState() => _NTextFieldState();
}

class _NTextFieldState extends State<NTextField> {
  @override
  Widget build(BuildContext context) {
    final OS _operatingSystem = (widget.useMaterial)
        ? OS.android
        : (widget.useCupertino)
            ? OS.ios
            : (widget.useCupertinoPro)
                ? OS.mac
                : (widget.useFluent)
                    ? OS.windows
                    : (widget.useLinux)
                        ? OS.linux
                        : (widget.useWeb)
                            ? OS.web
                            : (Platform.isAndroid)
                                ? OS.android
                                : (Platform.isIOS)
                                    ? OS.ios
                                    : (Platform.isMacOS)
                                        ? OS.mac
                                        : (Platform.isWindows)
                                            ? OS.windows
                                            : (Platform.isLinux)
                                                ? OS.linux
                                                : OS.web;

    return (_operatingSystem == OS.android)
        ? _androidField
        : (_operatingSystem == OS.ios)
            ? _iosField
            : (_operatingSystem == OS.mac)
                ? _macField
                : (_operatingSystem == OS.windows)
                    ? _windowsField
                    : (_operatingSystem == OS.linux)
                        ? _linuxField
                        : _webField;
  }

  get _iosSuffix {
    if ((widget.suffixText == null || widget.suffixText?.isEmpty == true) &&
        widget.suffixIcon == null) {
      return Container();
    } else if (widget.suffixIcon != null) {
      return Flexible(
          flex: 1,
          child: Icon(widget.suffixIcon!,
              color: widget.suffixIconColor ??
                  Theme.of(context).colorScheme.primary));
    } else {
      return Flexible(
        flex: 1,
        child: Text(widget.suffixText ?? '',
            style: widget.suffixStyle ??
                TextStyle(
                    color: Theme.of(context).colorScheme.onSurface,
                    fontFamily: fontFamily(OS.ios))),
      );
    }
  }

  get _iosBorderSide => BorderSide(
      color: widget.isOutlined
          ? Theme.of(context).colorScheme.onSurface
          : Colors.transparent,
      width: 0.0);

  get _iosDecoration => widget.isOutlined
      ? BoxDecoration(
          color: widget.filled == true
              ? widget.fillColor ?? Theme.of(context).colorScheme.surface
              : Colors.transparent,
          borderRadius: const BorderRadius.all(Radius.circular(5.0)),
          border: Border(
              top: _iosBorderSide,
              bottom: _iosBorderSide,
              left: _iosBorderSide,
              right: _iosBorderSide))
      : BoxDecoration(
          color: widget.filled == true
              ? widget.fillColor ?? Theme.of(context).colorScheme.surface
              : Colors.transparent,
          borderRadius: const BorderRadius.all(Radius.circular(5.0)),
          border: Border(
              top: _iosBorderSide,
              bottom: _iosBorderSide,
              left: _iosBorderSide,
              right: _iosBorderSide));

  get _androidDecoration => InputDecoration(
        icon: (widget.icon != null)
            ? Icon(widget.icon,
                color:
                    widget.iconColor ?? Theme.of(context).colorScheme.onSurface)
            : null,
        labelText: widget.labelText,
        labelStyle: widget.labelStyle ??
            TextStyle(
                color: Theme.of(context).colorScheme.onSurface,
                fontFamily: fontFamily(OS.android)),
        floatingLabelStyle: widget.floatingLabelStyle ??
            TextStyle(
                color: Theme.of(context).colorScheme.onSurface,
                fontFamily: fontFamily(OS.android)),
        helperText: widget.helperText,
        helperStyle: widget.helperStyle ??
            TextStyle(
                color: Theme.of(context).colorScheme.onSurface,
                fontFamily: fontFamily(OS.android)),
        helperMaxLines: widget.helperMaxLines,
        hintText: widget.hintText,
        hintStyle: widget.hintStyle ??
            TextStyle(
                color: Theme.of(context).colorScheme.onSurface,
                fontFamily: fontFamily(OS.android)),
        hintTextDirection: widget.hintTextDirection,
        hintMaxLines: widget.hintMaxLines,
        errorText: widget.errorText,
        errorStyle: widget.errorStyle ??
            TextStyle(
                color: Theme.of(context).colorScheme.onSurface,
                fontFamily: fontFamily(OS.android)),
        errorMaxLines: widget.errorMaxLines,
        floatingLabelBehavior: widget.floatingLabelBehavior,
        isCollapsed: widget.isCollapsed,
        isDense: widget.isDense,
        contentPadding: widget.contentPadding,
        prefix: Icon(widget.prefixIcon,
            color: widget.prefixIconColor ??
                Theme.of(context).colorScheme.onSurface),
        prefixIconConstraints: BoxConstraints.tight(const Size(44, 44)),
        suffixIcon: Icon(widget.suffixIcon,
            color: widget.suffixIconColor ??
                Theme.of(context).colorScheme.primary),
        suffixText: widget.suffixText,
        suffixStyle: widget.suffixStyle ??
            TextStyle(
                color: Theme.of(context).colorScheme.onSurface,
                fontFamily: fontFamily(OS.android)),
        suffixIconConstraints: BoxConstraints.tight(const Size(44, 44)),
        counterText: widget.counterText,
        counterStyle: widget.counterStyle ??
            TextStyle(
                color: Theme.of(context).colorScheme.onSurface,
                fontFamily: fontFamily(OS.android)),
        filled: widget.filled,
        fillColor: widget.fillColor,
        focusColor: widget.focusColor,
        hoverColor: widget.hoverColor,
        errorBorder: (widget.isOutlined)
            ? widget.errorBorder ??
                OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Theme.of(context).errorColor,
                        width: 1,
                        style: BorderStyle.solid))
            : UnderlineInputBorder(
                borderSide: BorderSide(
                    color: Theme.of(context).errorColor,
                    width: 1,
                    style: BorderStyle.solid)),
        focusedBorder: (widget.isOutlined)
            ? widget.focusedBorder ??
                OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Theme.of(context).primaryColor,
                        width: 1,
                        style: BorderStyle.solid))
            : UnderlineInputBorder(
                borderSide: BorderSide(
                    color: Theme.of(context).primaryColor,
                    width: 1,
                    style: BorderStyle.solid)),
        focusedErrorBorder: (widget.isOutlined)
            ? widget.focusedErrorBorder ??
                OutlineInputBorder(
                    borderSide: BorderSide(
                        color:
                            widget.focusColor ?? Theme.of(context).focusColor,
                        width: 1,
                        style: BorderStyle.solid))
            : UnderlineInputBorder(
                borderSide: BorderSide(
                    color: widget.focusColor ?? Theme.of(context).focusColor,
                    width: 1,
                    style: BorderStyle.solid)),
        disabledBorder: (widget.isOutlined)
            ? widget.disabledBorder ??
                OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Theme.of(context).disabledColor,
                        width: 1,
                        style: BorderStyle.solid))
            : UnderlineInputBorder(
                borderSide: BorderSide(
                    color: Theme.of(context).disabledColor,
                    width: 1,
                    style: BorderStyle.solid)),
        enabledBorder: (widget.isOutlined)
            ? widget.enabledBorder ??
                OutlineInputBorder(
                    borderSide: BorderSide(
                        color: widget.iconColor ??
                            widget.prefixIconColor ??
                            widget.suffixIconColor ??
                            Theme.of(context).colorScheme.onSurface,
                        width: 0.0,
                        style: BorderStyle.solid))
            : UnderlineInputBorder(
                borderSide: BorderSide(
                    color: widget.iconColor ??
                        widget.prefixIconColor ??
                        widget.suffixIconColor ??
                        Theme.of(context).colorScheme.onSurface,
                    width: 0.0,
                    style: BorderStyle.solid)),
        semanticCounterText: widget.semanticCounterText,
        alignLabelWithHint: widget.alignLabelWithHint,
        constraints: widget.constraints ?? const BoxConstraints(maxHeight: 44),
      );

  get _androidField => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: TextFormField(
          key: widget.key,
          controller: widget.controller,
          initialValue: widget.initialValue,
          focusNode: widget.focusNode,
          decoration: _androidDecoration,
          keyboardType: widget.keyboardType,
          textCapitalization: widget.textCapitalization,
          textInputAction: widget.textInputAction,
          style: widget.style,
          strutStyle: widget.strutStyle,
          textDirection: widget.textDirection,
          textAlign: widget.textAlign,
          textAlignVertical: widget.textAlignVertical,
          autofocus: widget.autofocus,
          readOnly: widget.readOnly,
          toolbarOptions: widget.toolbarOptions,
          showCursor: widget.showCursor,
          obscuringCharacter: widget.obscuringCharacter,
          obscureText: widget.obscureText,
          autocorrect: widget.autocorrect,
          smartDashesType: widget.smartDashesType,
          smartQuotesType: widget.smartQuotesType,
          enableSuggestions: widget.enableSuggestions,
          maxLengthEnforcement: widget.maxLengthEnforcement,
          maxLines: widget.maxLines,
          minLines: widget.minLines,
          expands: widget.expands,
          maxLength: widget.maxLength,
          onChanged: widget.onChanged,
          onTap: widget.onTap,
          onEditingComplete: widget.onEditingComplete,
          onFieldSubmitted: widget.onFieldSubmitted,
          onSaved: widget.onSaved,
          validator: widget.validator,
          inputFormatters: widget.inputFormatters,
          enabled: widget.enabled,
          cursorWidth: widget.cursorWidth,
          cursorHeight: widget.cursorHeight,
          cursorRadius: widget.cursorRadius,
          cursorColor: widget.cursorColor,
          keyboardAppearance: widget.keyboardAppearance,
          scrollPadding: widget.scrollPadding,
          enableInteractiveSelection: widget.enableInteractiveSelection,
          selectionControls: widget.selectionControls,
          buildCounter: widget.buildCounter,
          scrollPhysics: widget.scrollPhysics,
          autofillHints: widget.autofillHints,
          autovalidateMode: widget.autovalidateMode,
          scrollController: widget.scrollController,
          restorationId: widget.restorationId,
          enableIMEPersonalizedLearning: widget.enableIMEPersonalizedLearning,
        ),
      );

  get _iosField {
    Text? _label = (widget.labelText != null)
        ? Text(widget.labelText ?? '',
            style: widget.labelStyle ??
                TextStyle(
                    color: Theme.of(context).colorScheme.onSurface,
                    fontFamily: fontFamily(OS.ios)))
        : null;

    Widget? _prefixIcon = (widget.prefixIcon != null)
        ? Icon(widget.prefixIcon,
            color: widget.prefixIconColor ??
                Theme.of(context).colorScheme.onSurface)
        : null;

    Widget? _prefix;
    double _sizeDiff = 32.0;

    if (_prefixIcon != null && _label != null) {
      _prefix = SizedBox(
        height: 36,
        child: Row(
          children: [
            _prefixIcon,
            const SizedBox(width: 3),
            Padding(
              padding: const EdgeInsets.only(right: 6.0),
              child: _label,
            ),
          ],
        ),
      );
    } else if (_prefixIcon != null) {
      _prefix = Padding(
        padding: const EdgeInsets.only(right: 6.0),
        child: _prefixIcon,
      );
    } else if (_label != null) {
      _prefix = Padding(
        padding: const EdgeInsets.only(right: 6.0),
        child: _label,
      );
    } else {
      _prefix = null;
    }

    if (widget.suffixIcon != null) {
      _sizeDiff += 44;
    }
    if (widget.suffixText != null) {
      _sizeDiff += 120;
    }
    Widget? _icon = (widget.icon != null)
        ? Icon(widget.icon,
            color: widget.iconColor ?? Theme.of(context).colorScheme.primary)
        : null;

    return Row(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width - _sizeDiff,
          child: CupertinoFormRow(
            prefix: _icon,
            child: CupertinoTextFormFieldRow(
              decoration: _iosDecoration,
              controller: widget.controller,
              validator: widget.validator,
              prefix: _prefix,
              onSaved: widget.onSaved,
              onChanged: widget.onChanged,
              onTap: widget.onTap,
              focusNode: widget.focusNode,
              placeholder: widget.hintText,
              placeholderStyle: widget.hintStyle,
              keyboardType: widget.keyboardType,
              textInputAction: widget.textInputAction,
              textCapitalization: widget.textCapitalization,
              style: widget.style ??
                  TextStyle(color: Theme.of(context).colorScheme.onSurface),
              strutStyle: widget.strutStyle,
              textAlign: widget.textAlign,
              textAlignVertical: widget.textAlignVertical,
              textDirection: widget.textDirection,
              readOnly: widget.readOnly,
              toolbarOptions: widget.toolbarOptions,
              showCursor: widget.showCursor,
              autofocus: widget.autofocus,
              obscuringCharacter: widget.obscuringCharacter,
              obscureText: widget.obscureText,
              autocorrect: widget.autocorrect,
              smartDashesType: widget.smartDashesType,
              smartQuotesType: widget.smartQuotesType,
              enableSuggestions: widget.enableSuggestions,
              maxLines: widget.maxLines,
              minLines: widget.minLines,
              expands: widget.expands,
              maxLength: widget.maxLength,
              onEditingComplete: widget.onEditingComplete,
              inputFormatters: widget.inputFormatters,
              enabled: widget.enabled,
              cursorWidth: widget.cursorWidth,
              cursorHeight: widget.cursorHeight,
              cursorColor: widget.cursorColor,
              keyboardAppearance: widget.keyboardAppearance,
              scrollPadding: widget.scrollPadding,
              enableInteractiveSelection: widget.enableInteractiveSelection,
              selectionControls: widget.selectionControls,
              scrollPhysics: widget.scrollPhysics,
              autofillHints: widget.autofillHints,
            ),
            helper: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (widget.helperText?.isNotEmpty == true)
                  Text(widget.helperText!,
                      style: widget.helperStyle ??
                          TextStyle(
                              fontSize: 14,
                              color: Theme.of(context).colorScheme.onSurface),
                      maxLines: widget.helperMaxLines ??
                          Theme.of(context)
                              .inputDecorationTheme
                              .helperMaxLines),
                Expanded(child: Container()),
                if (widget.counterText?.isNotEmpty == true)
                  Text(
                    widget.counterText!,
                    style: widget.counterStyle ??
                        TextStyle(
                            fontSize: 14,
                            color: Theme.of(context).colorScheme.onSurface),
                  )
              ],
            ),
            error: (widget.errorText?.isNotEmpty == true)
                ? Text(widget.errorText!,
                    style: widget.errorStyle, maxLines: widget.errorMaxLines)
                : null,
          ),
        ),
        _iosSuffix
      ],
    );
  }

  get _macField => _iosField;

  get _windowsField => Row();

  get _linuxField => Row();

  get _webField => Row();
}

class NTextFieldOutlined extends NTextField {
  const NTextFieldOutlined({
    Key? key,
    TextEditingController? controller,
    String? initialValue,
    FocusNode? focusNode,
    TextInputType? keyboardType,
    TextCapitalization textCapitalization = TextCapitalization.none,
    TextInputAction? textInputAction,
    TextStyle? style,
    bool autofocus = false,
    bool readOnly = false,
    ToolbarOptions? toolbarOptions,
    bool? showCursor,
    SmartDashesType? smartDashesType,
    SmartQuotesType? smartQuotesType,
    MaxLengthEnforcement? maxLengthEnforcement,
    int maxLines = 1,
    int? minLines,
    int? maxLength,
    ValueChanged<String>? onChanged,
    GestureTapCallback? onTap,
    VoidCallback? onEditingComplete,
    ValueChanged<String>? onFieldSubmitted,
    FormFieldSetter<String>? onSaved,
    FormFieldValidator<String>? validator,
    List<TextInputFormatter>? inputFormatters,
    bool enabled = true,
    Color? cursorColor,
    Brightness? keyboardAppearance,
    TextSelectionControls? selectionControls,
    InputCounterWidgetBuilder? buildCounter,
    ScrollPhysics? scrollPhysics,
    Iterable<String>? autofillHints,
    AutovalidateMode autovalidateMode = AutovalidateMode.disabled,
    ScrollController? scrollController,
    IconData? icon,
    Color? iconColor,
    IconData? prefixIcon,
    Color? prefixIconColor,
    String? labelText,
    TextStyle? labelStyle,
    TextStyle? floatingLabelStyle,
    String? hintText, //placeholder
    String? helperText,
    TextStyle? helperStyle,
    int? helperMaxLines,
    String? errorText,
    TextStyle? errorStyle,
    int? errorMaxLines,
    FloatingLabelBehavior? floatingLabelBehavior,
    bool? isDense,
    EdgeInsetsGeometry? contentPadding,
    String? suffixText,
    IconData? suffixIcon,
    Color? suffixIconColor,
    String? counterText,
    Widget? counter,
    TextStyle? counterStyle,
    bool? filled = true,
    Color? fillColor,
    Color? focusColor,
    Color? hoverColor,
    String? semanticCounterText,
    bool? alignLabelWithHint,
    BoxConstraints? constraints,
    bool useMaterial = false,
    bool useCupertino = false,
    bool useCupertinoPro = false,
    bool useFluent = false,
    bool useLinux = false,
    bool useWeb = false,
  }) : super(
          key: key,
          controller: controller,
          initialValue: initialValue,
          focusNode: focusNode,
          keyboardType: keyboardType,
          textCapitalization: textCapitalization,
          textInputAction: textInputAction,
          style: style,
          autofocus: autofocus,
          readOnly: readOnly,
          toolbarOptions: toolbarOptions,
          showCursor: showCursor,
          smartDashesType: smartDashesType,
          smartQuotesType: smartQuotesType,
          maxLengthEnforcement: maxLengthEnforcement,
          maxLines: maxLines,
          minLines: minLines,
          maxLength: maxLength,
          onChanged: onChanged,
          onTap: onTap,
          onEditingComplete: onEditingComplete,
          onFieldSubmitted: onFieldSubmitted,
          onSaved: onSaved,
          validator: validator,
          inputFormatters: inputFormatters,
          enabled: enabled,
          cursorColor: cursorColor,
          keyboardAppearance: keyboardAppearance,
          selectionControls: selectionControls,
          buildCounter: buildCounter,
          scrollPhysics: scrollPhysics,
          autofillHints: autofillHints,
          autovalidateMode: autovalidateMode,
          scrollController: scrollController,
          icon: icon,
          iconColor: iconColor,
          prefixIcon: prefixIcon,
          prefixIconColor: prefixIconColor,
          labelText: labelText,
          labelStyle: labelStyle,
          floatingLabelStyle: floatingLabelStyle,
          hintText: hintText,
          helperText: helperText,
          helperStyle: helperStyle,
          helperMaxLines: helperMaxLines,
          errorText: errorText,
          errorStyle: errorStyle,
          errorMaxLines: errorMaxLines,
          floatingLabelBehavior: floatingLabelBehavior,
          isDense: isDense,
          contentPadding: contentPadding,
          suffixText: suffixText,
          suffixIcon: suffixIcon,
          suffixIconColor: suffixIconColor,
          counterText: counterText,
          counterStyle: counterStyle,
          filled: filled,
          fillColor: fillColor,
          focusColor: focusColor,
          hoverColor: hoverColor,
          semanticCounterText: semanticCounterText,
          alignLabelWithHint: alignLabelWithHint,
          constraints: constraints,
          useMaterial: useMaterial,
          useCupertino: useCupertino,
          useCupertinoPro: useCupertinoPro,
          useFluent: useFluent,
          useLinux: useLinux,
          useWeb: useWeb,
          isOutlined: true,
        );
}
