import 'dart:ui';
import 'dart:ui' as ui show BoxHeightStyle, BoxWidthStyle;

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:core/core.dart';

/// A Material Design text field input.
class TextboxField extends FormBuilderField<String> {
  /// Controls the text being edited.
  ///
  /// If null, this widget will create its own [TextEditingController].
  final TextEditingController? controller;

  /// {@macro flutter.widgets.editableText.keyboardType}
  final TextInputType? keyboardType;

  /// The type of action button to use for the keyboard.
  ///
  /// Defaults to [TextInputAction.newline] if [keyboardType] is
  /// [TextInputType.multiline] and [TextInputAction.done] otherwise.
  final TextInputAction? textInputAction;

  /// {@macro flutter.widgets.editableText.textCapitalization}
  final TextCapitalization textCapitalization;

  /// The style to use for the text being edited.
  ///
  /// This text style is also used as the base style for the [decoration].
  ///
  /// If null, defaults to the `subtitle1` text style from the current [Theme].
  final TextStyle? style;

  /// {@macro flutter.widgets.editableText.strutStyle}
  final StrutStyle? strutStyle;

  /// {@macro flutter.widgets.editableText.textAlign}
  final TextAlign textAlign;

  /// {@macro flutter.widgets.inputDecorator.textAlignVertical}
  final TextAlignVertical? textAlignVertical;

  /// {@macro flutter.widgets.editableText.textDirection}
  final TextDirection? textDirection;

  /// {@macro flutter.widgets.editableText.autofocus}
  final bool autofocus;

  /// {@macro flutter.widgets.editableText.obscuringCharacter}
  final String obscuringCharacter;

  /// {@macro flutter.widgets.editableText.obscureText}
  final bool obscureText;

  /// {@macro flutter.widgets.editableText.autocorrect}
  final bool autocorrect;

  /// {@macro flutter.services.textInput.smartDashesType}
  final SmartDashesType? smartDashesType;

  /// {@macro flutter.services.textInput.smartQuotesType}
  final SmartQuotesType? smartQuotesType;

  /// {@macro flutter.services.textInput.enableSuggestions}
  final bool enableSuggestions;

  /// {@macro flutter.widgets.editableText.maxLines}
  final int? maxLines;

  /// {@macro flutter.widgets.editableText.minLines}
  final int? minLines;

  /// {@macro flutter.widgets.editableText.expands}
  final bool expands;

  /// Configuration of toolbar options.
  ///
  /// If not set, select all and paste will default to be enabled. Copy and cut
  /// will be disabled if [obscureText] is true. If [readOnly] is true,
  /// paste and cut will be disabled regardless.
  final ToolbarOptions? toolbarOptions;

  /// {@macro flutter.widgets.editableText.showCursor}
  final bool? showCursor;

  /// If [maxLength] is set to this value, only the "current input length"
  /// part of the character counter is shown.
  static const int noMaxLength = -1;

  final int? maxLength;

  final MaxLengthEnforcement? maxLengthEnforcement;
  final VoidCallback? onEditingComplete;
  final ValueChanged<String?>? onSubmitted;
  final List<TextInputFormatter>? inputFormatters;
  final double cursorWidth;
  final Radius? cursorRadius;
  final Color? cursorColor;
  final ui.BoxHeightStyle selectionHeightStyle;
  final ui.BoxWidthStyle selectionWidthStyle;
  final Brightness? keyboardAppearance;
  final EdgeInsets scrollPadding;
  final bool enableInteractiveSelection;
  final DragStartBehavior dragStartBehavior;
  bool get selectionEnabled => enableInteractiveSelection;
  final GestureTapCallback? onTap;
  final MouseCursor? mouseCursor;
  final InputCounterWidgetBuilder? buildCounter;
  final ScrollPhysics? scrollPhysics;
  final ScrollController? scrollController;
  final Iterable<String>? autofillHints;

  final bool? isRequired;
  final String? title;
  final String? placeholder;

  TextboxField(
      {Key? key,
      //From Super
      required String name,
      FormFieldValidator<String>? validator,
      String? initialValue,
      bool readOnly = false,
      InputDecoration decoration = const InputDecoration(),
      ValueChanged<String?>? onChanged,
      ValueTransformer<String?>? valueTransformer,
      bool enabled = true,
      FormFieldSetter<String>? onSaved,
      AutovalidateMode autovalidateMode = AutovalidateMode.disabled,
      VoidCallback? onReset,
      FocusNode? focusNode,
      this.maxLines = 1,
      this.obscureText = false,
      this.textCapitalization = TextCapitalization.none,
      this.scrollPadding = const EdgeInsets.all(20.0),
      this.enableInteractiveSelection = true,
      this.maxLengthEnforcement,
      this.textAlign = TextAlign.start,
      this.autofocus = false,
      this.autocorrect = true,
      this.cursorWidth = 2.0,
      this.keyboardType,
      this.style,
      this.controller,
      this.textInputAction,
      this.strutStyle,
      this.textDirection,
      this.maxLength,
      this.onEditingComplete,
      this.onSubmitted,
      this.inputFormatters,
      this.cursorRadius,
      this.cursorColor = Colors.black,
      this.keyboardAppearance,
      this.buildCounter,
      this.expands = false,
      this.minLines,
      this.showCursor,
      this.onTap,
      this.enableSuggestions = false,
      this.textAlignVertical,
      this.dragStartBehavior = DragStartBehavior.start,
      this.scrollController,
      this.scrollPhysics,
      this.selectionWidthStyle = ui.BoxWidthStyle.tight,
      this.smartDashesType,
      this.smartQuotesType,
      this.toolbarOptions,
      this.selectionHeightStyle = ui.BoxHeightStyle.tight,
      this.autofillHints,
      this.obscuringCharacter = '•',
      this.mouseCursor,
      this.isRequired = false,
      this.title,
      this.placeholder})
      : assert(initialValue == null || controller == null),
        assert(minLines == null || minLines > 0),
        assert(maxLines == null || maxLines > 0),
        assert(
          (minLines == null) || (maxLines == null) || (maxLines >= minLines),
          'minLines can\'t be greater than maxLines',
        ),
        assert(
          !expands || (minLines == null && maxLines == null),
          'minLines and maxLines must be null when expands is true.',
        ),
        assert(!obscureText || maxLines == 1,
            'Obscured fields cannot be multiline.'),
        assert(maxLength == null || maxLength > 0),
        super(
          key: key,
          initialValue: controller != null ? controller.text : initialValue,
          name: name,
          validator: validator,
          valueTransformer: valueTransformer,
          onChanged: onChanged,
          autovalidateMode: autovalidateMode,
          onSaved: onSaved,
          enabled: enabled,
          onReset: onReset,
          decoration: decoration,
          focusNode: focusNode,
          builder: (FormFieldState<String?> field) {
            final state = field as _TextboxFieldState;
            // Customized here
            return Container(
              padding: AppConsts.kMarginAll,
              decoration: BoxDecoration(
                  border: Border.all(color: AppColors.neutral400, width: 1.0),
                  borderRadius: BorderRadius.circular(12)),
              child: Column(children: [
                title != null
                    ? Container(
                        padding: const EdgeInsets.all(0),
                        alignment: Alignment.topLeft,
                        child: Row(
                          children: [
                            Text(
                              title,
                              style: const TextStyle(
                                color: AppColors.midGrey,
                                fontSize: AppSizes.textTitleSize,
                                fontWeight: FontWeight.normal,
                              ),
                              textAlign: TextAlign.left,
                            ),
                            if (isRequired == true)
                              const Text(
                                ' *',
                                style: TextStyle(
                                    color: Colors.red,
                                    fontSize: AppSizes.textTitleSize),
                              )
                            else
                              const Text('')
                          ],
                        ),
                      )
                    : Container(),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                    child: TextField(
                      controller: state._effectiveController,
                      focusNode: state.effectiveFocusNode,
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.only(bottom: 10),
                          border: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          hintText: placeholder ?? '',
                          hintStyle:
                              style?.copyWith(color: AppColors.midGrey) ??
                                  const TextStyle(
                                      color: AppColors.midGrey,
                                      fontSize: AppSizes.textFieldSize),
                          fillColor: Colors.red),
                      keyboardType: TextInputType.multiline,
                      textInputAction: textInputAction,
                      style: style ??
                          const TextStyle(
                              fontSize: AppSizes.textFieldSize,
                              fontWeight: FontWeight.normal),
                      strutStyle: strutStyle,
                      textAlign: textAlign,
                      textAlignVertical: textAlignVertical,
                      textDirection: textDirection,
                      textCapitalization: textCapitalization,
                      autofocus: autofocus,
                      readOnly: readOnly,
                      showCursor: showCursor,
                      obscureText: obscureText,
                      autocorrect: autocorrect,
                      enableSuggestions: enableSuggestions,
                      maxLengthEnforcement: maxLengthEnforcement,
                      maxLines: maxLines,
                      minLines: minLines,
                      expands: expands,
                      maxLength: maxLength,
                      onTap: onTap,
                      onEditingComplete: onEditingComplete,
                      onSubmitted: onSubmitted,
                      inputFormatters: inputFormatters,
                      enabled: state.enabled,
                      cursorWidth: cursorWidth,
                      cursorRadius: cursorRadius,
                      cursorColor: cursorColor,
                      scrollPadding: scrollPadding,
                      keyboardAppearance: keyboardAppearance,
                      enableInteractiveSelection: enableInteractiveSelection,
                      buildCounter: buildCounter,
                      dragStartBehavior: dragStartBehavior,
                      scrollController: scrollController,
                      scrollPhysics: scrollPhysics,
                      selectionHeightStyle: selectionHeightStyle,
                      selectionWidthStyle: selectionWidthStyle,
                      smartDashesType: smartDashesType,
                      smartQuotesType: smartQuotesType,
                      toolbarOptions: toolbarOptions,
                      mouseCursor: mouseCursor,
                      obscuringCharacter: obscuringCharacter,
                      autofillHints: autofillHints,
                    ),
                  ),
                )
              ]),
            );
          },
        );

  @override
  _TextboxFieldState createState() => _TextboxFieldState();

  Widget checkRequired() {
    if (isRequired == true) {
      return const Text(
        '*',
        style: TextStyle(color: Colors.red, fontSize: AppSizes.textTitleSize),
      );
    } else {
      return const Text(
        '*',
        style: TextStyle(color: Colors.red, fontSize: AppSizes.textTitleSize),
      );
    }
  }
}

class _TextboxFieldState extends FormBuilderFieldState<TextboxField, String> {
  TextEditingController? get _effectiveController =>
      widget.controller ?? _controller;

  TextEditingController? _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        widget.controller ?? TextEditingController(text: initialValue);
    _controller!.addListener(_handleControllerChanged);
  }

  @override
  void dispose() {
    // Dispose the _controller when initState created it
    _controller!.removeListener(_handleControllerChanged);
    if (null == widget.controller) {
      _controller!.dispose();
    }
    super.dispose();
  }

  @override
  void reset() {
    super.reset();
    setState(() {
      _effectiveController!.text = initialValue ?? '';
    });
  }

  @override
  void didChange(String? value) {
    super.didChange(value);

    if (_effectiveController!.text != value) {
      _effectiveController!.text = value!;
    }
  }

  void _handleControllerChanged() {
    if (_effectiveController!.text != value) {
      didChange(_effectiveController!.text);
    }
  }
}
