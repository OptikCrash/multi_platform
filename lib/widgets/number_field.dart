import 'dart:async';
import 'dart:io' show Platform;

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:multi_platform/widgets/text_field.dart';

import '../enums.dart';

enum _InputAction { increment, decrement, reset }

enum InputStyle {
  inline,
  inlineStackButtons,
  inlineSymmetric,
  roundStacked,
  roundInline
}

class NNumericField extends StatefulWidget {
  const NNumericField({
    Key? key,
    this.controller,
    this.initialValue = 0,
    this.focusNode,
    this.textInputAction,
    this.style,
    this.toolbarOptions,
    this.showCursor,
    this.onChanged,
    this.onTap,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.onSaved,
    this.validator,
    this.cursorWidth = 2.0,
    this.cursorHeight,
    this.cursorRadius = const Radius.circular(2.0),
    this.cursorColor,
    this.keyboardAppearance,
    this.selectionControls,
    this.buildCounter,
    this.autovalidateMode = AutovalidateMode.disabled,
    this.restorationId,
    this.icon,
    this.iconColor,
    this.labelText,
    this.labelStyle,
    this.floatingLabelStyle,
    this.hintTextDirection,
    this.hintMaxLines,
    this.errorText,
    this.errorStyle,
    this.floatingLabelBehavior,
    this.isDense,
    this.contentPadding,
    this.footerLeftText,
    this.footerLeftStyle,
    this.footerLeftMaxLines,
    this.footerRightText,
    this.footerRight,
    this.footerRightStyle,
    this.fillColor,
    this.focusColor,
    this.hoverColor,
    this.errorBorder,
    this.focusedBorder,
    this.focusedErrorBorder,
    this.disabledBorder,
    this.enabledBorder,
    this.semanticCounterText,
    this.constraints,
    this.autofocus = false,
    this.readOnly = false,
    this.enabled = true,
    this.enableInteractiveSelection = true,
    this.isCollapsed = false,
    this.isInteger = true,
    this.isOutlined = false,
    this.isNegativeValid = false,
    this.canReset = true,
    this.canIncrement = true,
    this.canDecrement = true,
    this.useMaterial = false,
    this.useCupertino = false,
    this.useCupertinoPro = false,
    this.useFluent = false,
    this.useLinux = false,
    this.useWeb = false,
    this.filled = false,
    this.dividerColor,
    this.incrementButtonColor,
    this.incrementButtonIconColor,
    this.decrementButtonColor,
    this.decrementButtonIconColor,
    this.resetButtonColor,
    this.resetButtonIconColor,
  }) : super(key: key);

  //region properties
  final TextEditingController? controller;
  final num? initialValue;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final TextStyle? style;
  final bool autofocus;
  final bool readOnly;
  final ToolbarOptions? toolbarOptions;
  final bool? showCursor;
  final ValueChanged<String>? onChanged;
  final GestureTapCallback? onTap;
  final VoidCallback? onEditingComplete;
  final ValueChanged<String>? onFieldSubmitted;
  final FormFieldSetter<String>? onSaved;
  final FormFieldValidator<String>? validator;
  final bool enabled;
  final double cursorWidth;
  final double? cursorHeight;
  final Radius cursorRadius;
  final Color? cursorColor;
  final Brightness? keyboardAppearance;
  final bool enableInteractiveSelection;
  final TextSelectionControls? selectionControls;
  final InputCounterWidgetBuilder? buildCounter;
  final AutovalidateMode autovalidateMode;
  final String? restorationId;
  final IconData? icon;
  final Color? iconColor;
  final String? labelText;
  final TextStyle? labelStyle;
  final TextStyle? floatingLabelStyle;
  final TextDirection? hintTextDirection;
  final int? hintMaxLines;
  final String? footerLeftText;
  final TextStyle? footerLeftStyle;
  final int? footerLeftMaxLines;
  final String? errorText;
  final TextStyle? errorStyle;
  final FloatingLabelBehavior? floatingLabelBehavior;
  final bool? isDense;
  final EdgeInsetsGeometry? contentPadding;
  final bool isCollapsed;
  final String? footerRightText;
  final Widget? footerRight;
  final TextStyle? footerRightStyle;
  final Color? focusColor;
  final Color? hoverColor;
  final InputBorder? errorBorder;
  final InputBorder? focusedBorder;
  final InputBorder? focusedErrorBorder;
  final InputBorder? disabledBorder;
  final InputBorder? enabledBorder;
  final String? semanticCounterText;
  final BoxConstraints? constraints;
  final bool isOutlined;
  final bool isInteger;
  final bool isNegativeValid;
  final bool canReset;
  final bool canIncrement;
  final bool canDecrement;
  final bool useMaterial;
  final bool useCupertino;
  final bool useCupertinoPro;
  final bool useFluent;
  final bool useLinux;
  final bool useWeb;
  final bool filled;
  final Color? fillColor;
  final Color? dividerColor;
  final Color? incrementButtonColor;
  final Color? incrementButtonIconColor;
  final Color? decrementButtonColor;
  final Color? decrementButtonIconColor;
  final Color? resetButtonColor;
  final Color? resetButtonIconColor;
  //endregion

  @override
  _NumericInput createState() => _NumericInput();
}

class _NumericInput extends State<NNumericField> {
  final String _counterId = 'numeric-input-${DateTime.now().toIso8601String()}';
  late _NumericBloc bloc;
  late NTextField _field;

  @override
  void initState() {
    super.initState();
    //region choose type by os or request
    final OS _operatingSystem = (kIsWeb)
        ? OS.web
        : (widget.useMaterial)
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
    //endregion
    //region choose bloc selection type
    bloc = widget.isInteger
        ? _IntBloc(
            context: context,
            initialValue: widget.controller?.text.isEmpty == true
                ? widget.initialValue != null
                    ? widget.initialValue!.toInt()
                    : 0
                : int.tryParse(widget.controller!.text) ?? 0,
            isNegativeValid: widget.isNegativeValid)
        : _DoubleBloc(
            context: context,
            initialValue: widget.controller?.text != null
                ? double.tryParse(widget.controller!.text) ?? 0.00
                : widget.initialValue != null
                    ? widget.initialValue!.toDouble()
                    : 0.00,
            isNegativeValid: widget.isNegativeValid) as _NumericBloc;
    bloc.stream.listen((event) {
      widget.controller!.text = event.toString();
    });
    //endregion
    _field = NTextField(
      controller: widget.controller,
      // initialValue: widget.initialValue,
      focusNode: widget.focusNode,
      textInputAction: widget.textInputAction,
      style: widget.style,
      toolbarOptions: widget.toolbarOptions,
      showCursor: widget.showCursor,
      onChanged: widget.onChanged,
      onTap: widget.onTap,
      onEditingComplete: widget.onEditingComplete,
      onFieldSubmitted: widget.onFieldSubmitted,
      onSaved: widget.onSaved,
      validator: widget.validator,
      cursorWidth: widget.cursorWidth,
      cursorHeight: widget.cursorHeight,
      cursorRadius: widget.cursorRadius,
      cursorColor: widget.cursorColor,
      keyboardAppearance: widget.keyboardAppearance,
      selectionControls: widget.selectionControls,
      buildCounter: widget.buildCounter,
      autovalidateMode: widget.autovalidateMode,
      restorationId: widget.restorationId,
      icon: widget.icon,
      iconColor: widget.iconColor,
      labelText: widget.labelText,
      labelStyle: widget.labelStyle,
      floatingLabelStyle: widget.floatingLabelStyle,
      hintTextDirection: widget.hintTextDirection,
      hintMaxLines: widget.hintMaxLines,
      errorText: widget.errorText,
      errorStyle: widget.errorStyle,
      floatingLabelBehavior: widget.floatingLabelBehavior,
      isDense: widget.isDense,
      contentPadding: widget.contentPadding,
      helperText: widget.footerLeftText,
      helperStyle: widget.footerLeftStyle,
      helperMaxLines: widget.footerLeftMaxLines,
      counterText: widget.footerRightText,
      counterStyle: widget.footerRightStyle,
      fillColor: widget.fillColor,
      focusColor: widget.focusColor,
      hoverColor: widget.hoverColor,
      errorBorder: widget.errorBorder,
      focusedBorder: widget.focusedBorder,
      focusedErrorBorder: widget.focusedErrorBorder,
      disabledBorder: widget.disabledBorder,
      enabledBorder: widget.enabledBorder,
      semanticCounterText: widget.semanticCounterText,
      constraints: widget.constraints,
      autofocus: widget.autofocus,
      readOnly: widget.readOnly,
      enabled: widget.enabled,
      enableInteractiveSelection: widget.enableInteractiveSelection,
      isOutlined: widget.isOutlined,
      isCollapsed: widget.isCollapsed,
      useMaterial: widget.useMaterial,
      useCupertino: widget.useCupertino,
      useCupertinoPro: widget.useCupertinoPro,
      useFluent: widget.useFluent,
      useLinux: widget.useLinux,
      useWeb: widget.useWeb,
      filled: widget.filled,
    );
  }

  @override
  Widget build(BuildContext context) {
    // double variableWidth = 96;
    // if (widget.icon != null) {
    //   variableWidth += 36;
    // }
    // if (widget.canDecrement) {
    //   variableWidth += 36;
    // }
    // if (widget.label != null || widget.labelText != null) {
    //   variableWidth += 36;
    // }
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _leading,
          Flexible(
            fit: FlexFit.tight,
            child: _field,
          ),
          const SizedBox(width: 8),
          ..._trailing,
        ],
      ),
    );
    // return _isIOS
    //     ? Row(
    //         mainAxisSize: MainAxisSize.max,
    //         mainAxisAlignment: MainAxisAlignment.end,
    //         crossAxisAlignment: CrossAxisAlignment.start,
    //         children: [
    //           ConstrainedBox(
    //             constraints: BoxConstraints(
    //               minWidth: 96,
    //               maxWidth: variableWidth,
    //               minHeight: 102,
    //             ),
    //             child: CupertinoFormRow(
    //               prefix: widget.icon,
    //               child: CupertinoTextFormFieldRow(
    //                 decoration: _iosDecoration,
    //                 controller: widget.controller,
    //                 validator: widget.validator,
    //                 prefix: _iosPrefix,
    //                 onSaved: widget.onSaved,
    //                 onChanged: widget.onChanged,
    //                 onTap: widget.onTap,
    //                 focusNode: widget.focusNode,
    //                 keyboardType: TextInputType.number,
    //                 textInputAction: widget.textInputAction,
    //                 textAlign: TextAlign.center,
    //                 style: widget.style ??
    //                     TextStyle(
    //                         color: Theme.of(context).colorScheme.onSurface),
    //                 readOnly: widget.readOnly,
    //                 toolbarOptions: widget.toolbarOptions,
    //                 showCursor: widget.showCursor,
    //                 autofocus: widget.autofocus,
    //                 onEditingComplete: widget.onEditingComplete,
    //                 enabled: widget.enabled,
    //                 cursorWidth: widget.cursorWidth,
    //                 cursorHeight: widget.cursorHeight,
    //                 cursorColor: widget.cursorColor,
    //                 keyboardAppearance: widget.keyboardAppearance,
    //                 enableInteractiveSelection:
    //                     widget.enableInteractiveSelection,
    //                 selectionControls: widget.selectionControls,
    //               ),
    //               helper: _iosFooter,
    //               error: _iosError,
    //             ),
    //           ),
    //           Column(
    //             mainAxisSize: MainAxisSize.min,
    //             mainAxisAlignment: MainAxisAlignment.center,
    //             crossAxisAlignment: CrossAxisAlignment.end,
    //             children: [
    //               const SizedBox(height: 12),
    //               _iosSuffix,
    //               const SizedBox(height: 12),
    //               if (widget.footerRightText?.isNotEmpty == true)
    //                 Padding(
    //                   padding: const EdgeInsets.only(right: 12.0),
    //                   child: Text(
    //                     widget.footerRightText!,
    //                     style: widget.footerRightStyle ??
    //                         TextStyle(
    //                             fontSize: 14,
    //                             color: Theme.of(context).colorScheme.onSurface),
    //                   ),
    //                 ),
    //             ],
    //           )
    //         ],
    //       )
    //     : Padding(
    //         padding: const EdgeInsets.symmetric(horizontal: 16.0),
    //         child: Row(
    //           mainAxisSize: MainAxisSize.min,
    //           mainAxisAlignment: MainAxisAlignment.end,
    //           crossAxisAlignment: CrossAxisAlignment.start,
    //           children: [
    //             if (widget.icon != null)
    //               Padding(
    //                 padding: const EdgeInsets.only(top: 12),
    //                 child: widget.icon!,
    //               ),
    //             const SizedBox(width: 12),
    //             SizedBox(
    //               width: 140,
    //               height: 72,
    //               child: TextFormField(
    //                 key: widget.key,
    //                 controller: widget.controller,
    //                 focusNode: widget.focusNode,
    //                 decoration: _androidDecoration,
    //                 keyboardType: TextInputType.number,
    //                 textInputAction: widget.textInputAction,
    //                 style: widget.style,
    //                 textAlign: TextAlign.center,
    //                 autofocus: widget.autofocus,
    //                 readOnly: widget.readOnly,
    //                 toolbarOptions: widget.toolbarOptions,
    //                 showCursor: widget.showCursor,
    //                 onChanged: widget.onChanged,
    //                 onTap: widget.onTap,
    //                 onEditingComplete: widget.onEditingComplete,
    //                 onFieldSubmitted: widget.onFieldSubmitted,
    //                 onSaved: widget.onSaved,
    //                 validator: widget.validator,
    //                 enabled: widget.enabled,
    //                 cursorWidth: widget.cursorWidth,
    //                 cursorHeight: widget.cursorHeight,
    //                 cursorRadius: widget.cursorRadius,
    //                 cursorColor: widget.cursorColor,
    //                 keyboardAppearance: widget.keyboardAppearance,
    //                 enableInteractiveSelection:
    //                     widget.enableInteractiveSelection,
    //                 selectionControls: widget.selectionControls,
    //                 buildCounter: widget.buildCounter,
    //                 autovalidateMode: widget.autovalidateMode,
    //                 restorationId: widget.restorationId,
    //               ),
    //             ),
    //             const SizedBox(width: 12),
    //             Column(
    //               children: [
    //                 Row(
    //                   children: [
    //                     if (widget.canIncrement)
    //                       FloatingActionButton(
    //                         backgroundColor: widget.incrementButtonColor ??
    //                             Theme.of(context).colorScheme.secondary,
    //                         heroTag: "increment $_counterId",
    //                         mini: true,
    //                         child: Icon(
    //                           Icons.add,
    //                           color: widget.incrementButtonIconColor ??
    //                               Theme.of(context)
    //                                   .buttonTheme
    //                                   .colorScheme
    //                                   ?.onSecondary ??
    //                               Colors.white,
    //                         ),
    //                         onPressed: () => setState(() {
    //                           bloc.increment();
    //                         }),
    //                       ),
    //                     if (widget.canReset)
    //                       FloatingActionButton(
    //                         backgroundColor: widget.resetButtonColor ??
    //                             Theme.of(context).colorScheme.secondary,
    //                         heroTag: "reset $_counterId",
    //                         mini: true,
    //                         child: Icon(
    //                           Icons.refresh,
    //                           color: widget.resetButtonIconColor ??
    //                               Theme.of(context)
    //                                   .buttonTheme
    //                                   .colorScheme
    //                                   ?.onSecondary ??
    //                               Colors.white,
    //                         ),
    //                         onPressed: () => setState(() {
    //                           bloc.reset();
    //                         }),
    //                       ),
    //                   ],
    //                 ),
    //                 const SizedBox(height: 10),
    //                 if (_counter != null) _counter!,
    //                 const SizedBox(height: 16),
    //               ],
    //             ),
    //           ],
    //         ));
  }

  Widget? get _label => (widget.labelText != null)
      ? Text(
          widget.labelText!,
          style: widget.labelStyle ??
              TextStyle(color: Theme.of(context).colorScheme.onSurface),
        )
      : null;

  Widget? get _counter =>
      widget.footerRight ??
      ((widget.footerRightText != null)
          ? Text(
              widget.footerRightText!,
              style: widget.footerRightStyle ??
                  TextStyle(
                      fontSize: 12,
                      color: Theme.of(context).colorScheme.onSurface),
            )
          : null);

  get _leading => _decBtn;

  get _trailing => [_incBtn, const SizedBox(width: 8), _clrBtn];

  get _decBtn => FloatingActionButton(
        backgroundColor: widget.decrementButtonColor ??
            Theme.of(context).colorScheme.secondary,
        heroTag: "decrement $_counterId",
        mini: true,
        child: Icon(
          Icons.remove,
          color: widget.decrementButtonIconColor ??
              Theme.of(context).buttonTheme.colorScheme?.onSecondary ??
              Colors.white,
        ),
        onPressed: () => setState(() {
          bloc.decrement();
        }),
      );

  get _incBtn => FloatingActionButton(
        backgroundColor: widget.incrementButtonColor ??
            Theme.of(context).colorScheme.secondary,
        heroTag: "increment $_counterId",
        mini: true,
        child: Icon(
          Icons.add,
          color: widget.incrementButtonIconColor ??
              Theme.of(context).buttonTheme.colorScheme?.onSecondary ??
              Colors.white,
        ),
        onPressed: () => setState(() {
          bloc.increment();
        }),
      );

  get _clrBtn => FloatingActionButton(
        backgroundColor:
            widget.resetButtonColor ?? Theme.of(context).colorScheme.secondary,
        heroTag: "reset $_counterId",
        mini: true,
        child: Icon(
          Icons.refresh,
          color: widget.resetButtonIconColor ??
              Theme.of(context).buttonTheme.colorScheme?.onSecondary ??
              Colors.white,
        ),
        onPressed: () => setState(() {
          bloc.reset();
        }),
      );
}

class _IntBloc implements _NumericBloc<int> {
  late int _counter;
  late final bool isNegativeValid;
  late final _stateStreamController = StreamController<int>();
  late final _eventStreamController = StreamController<_InputAction>();

  StreamSink<int> get _counterSink => _stateStreamController.sink;
  Stream<int> get _counterStream => _stateStreamController.stream;
  StreamSink<_InputAction> get _eventSink => _eventStreamController.sink;
  Stream<_InputAction> get _eventStream => _eventStreamController.stream;
  @override
  Stream<int> get stream => _counterStream;

  _IntBloc({
    required BuildContext context,
    required int initialValue,
    required bool isNegativeValid,
  }) {
    _counter = initialValue;
    _eventStream.listen((event) {
      switch (event) {
        case _InputAction.increment:
          _counter++;
          break;
        case _InputAction.decrement:
          {
            if (!isNegativeValid && _counter == 0) {
              break;
            }
            _counter--;
          }
          break;
        case _InputAction.reset:
          _counter = 0;
          break;
      }
      _counterSink.add(_counter);
    });
  }

  @override
  Future<void> increment() async => _eventSink.add(_InputAction.increment);
  @override
  Future<void> decrement() async => _eventSink.add(_InputAction.decrement);
  @override
  Future<void> reset() async => _eventSink.add(_InputAction.reset);
}

class _DoubleBloc implements _NumericBloc<double> {
  late double _counter;
  late final bool isNegativeValid;
  late final _stateStreamController = StreamController<double>();
  late final _eventStreamController = StreamController<_InputAction>();

  StreamSink<double> get _counterSink => _stateStreamController.sink;
  Stream<double> get _counterStream => _stateStreamController.stream;
  StreamSink<_InputAction> get _eventSink => _eventStreamController.sink;
  Stream<_InputAction> get _eventStream => _eventStreamController.stream;
  @override
  Stream<double> get stream => _counterStream;

  _DoubleBloc({
    required BuildContext context,
    required double initialValue,
    required bool isNegativeValid,
  }) {
    _counter = initialValue;
    _eventStream.listen((event) {
      switch (event) {
        case _InputAction.increment:
          _counter++;
          break;
        case _InputAction.decrement:
          {
            if (!isNegativeValid && _counter == 0) {
              break;
            }
            _counter--;
          }
          break;
        case _InputAction.reset:
          _counter = 0;
          break;
      }
      _counterSink.add(_counter);
    });
  }

  @override
  Future<void> increment() async => _eventSink.add(_InputAction.increment);
  @override
  Future<void> decrement() async => _eventSink.add(_InputAction.decrement);
  @override
  Future<void> reset() async => _eventSink.add(_InputAction.reset);
}

abstract class _NumericBloc<num> {
  Stream<num> get stream;
  Future<void> increment();
  Future<void> decrement();
  Future<void> reset();
}
