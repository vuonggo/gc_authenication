import 'package:core/core.dart';
import 'package:core/styles/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'checkbox_items_view.dart';
import 'textbox_field.dart';

/// A list of Checkboxes for selecting multiple options
class QuestionCheckBoxField<T> extends FormBuilderField<List<T>> {
  final List<FormBuilderFieldOption<T>> options;
  final Color? activeColor;
  final Color? checkColor;
  final Color? focusColor;
  final Color? hoverColor;
  final List<T>? disabled;
  final MaterialTapTargetSize? materialTapTargetSize;
  final bool tristate;
  final Axis wrapDirection;
  final WrapAlignment wrapAlignment;
  final double wrapSpacing;
  final WrapAlignment wrapRunAlignment;
  final double wrapRunSpacing;
  final WrapCrossAlignment wrapCrossAxisAlignment;
  final TextDirection? wrapTextDirection;
  final VerticalDirection wrapVerticalDirection;
  final Widget? separator;
  final ControlAffinity controlAffinity;
  final OptionsOrientation orientation;

  final String? questionMsg;
  final String? hintQuestionMsg;

  final bool? isDetail;
  final bool? isSubQuestion;
  final bool? isRequired;
  final String? textBoxName;
  final bool? isBorder;
  final bool? isShortAnswer;

  /// Creates a list of Checkboxes for selecting multiple options
  QuestionCheckBoxField(
      {Key? key,
      //From Super
      required String name,
      FormFieldValidator<List<T>>? validator,
      List<T>? initialValue,
      InputDecoration decoration = const InputDecoration(),
      ValueChanged<List<T>?>? onChanged,
      ValueTransformer<List<T>?>? valueTransformer,
      bool enabled = true,
      FormFieldSetter<List<T>>? onSaved,
      AutovalidateMode autovalidateMode = AutovalidateMode.disabled,
      VoidCallback? onReset,
      FocusNode? focusNode,
      required this.options,
      this.activeColor,
      this.checkColor,
      this.focusColor,
      this.hoverColor,
      this.disabled,
      this.materialTapTargetSize,
      this.tristate = false,
      this.wrapDirection = Axis.horizontal,
      this.wrapAlignment = WrapAlignment.start,
      this.wrapSpacing = 0.0,
      this.wrapRunAlignment = WrapAlignment.start,
      this.wrapRunSpacing = 0.0,
      this.wrapCrossAxisAlignment = WrapCrossAlignment.start,
      this.wrapTextDirection,
      this.wrapVerticalDirection = VerticalDirection.down,
      this.separator,
      this.controlAffinity = ControlAffinity.leading,
      this.orientation = OptionsOrientation.wrap,
      this.questionMsg,
      this.hintQuestionMsg,
      this.isDetail = false,
      this.isSubQuestion = false,
      this.isRequired = false,
      this.isBorder = true,
      this.isShortAnswer = false,
      this.textBoxName})
      : super(
          key: key,
          initialValue: initialValue,
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
          builder: (FormFieldState<List<T>?> field) {
            final state = field as _QuestionCheckBoxFieldState<T>;
            return Column(
              children: [
                if (questionMsg != null)
                  Container(
                    alignment: Alignment.topLeft,
                    child: RichText(
                      text: TextSpan(
                          text: questionMsg,
                          style: CoreAppTheme.of(state.context)
                              .textTheme
                              .bodyText2!
                              .copyWith(
                                  fontSize: 16 *
                                      MediaQuery.of(state.context)
                                          .textScaleFactor),
                          children: [
                            TextSpan(
                                text: isRequired == true ? ' *' : '',
                                style: CoreAppTheme.of(state.context)
                                    .textTheme
                                    .bodyText2!
                                    .copyWith(
                                        color: AppColors.red,
                                        fontSize: 16 *
                                            MediaQuery.of(state.context)
                                                .textScaleFactor)),
                          ]),
                    ),
                  ),
                if (hintQuestionMsg != null)
                  Container(
                    alignment: Alignment.topLeft,
                    padding: const EdgeInsets.only(top: 5),
                    child: Text(
                      hintQuestionMsg,
                      textAlign: TextAlign.left,
                      style: CoreAppTheme.of(state.context)
                          .textTheme
                          .subtitle2!
                          .copyWith(color: AppColors.midGrey),
                    ),
                  ),
                if (questionMsg != null) const SizedBox(height: 5),
                CheckBoxItemsView<T>(
                  orientation: orientation,
                  value: state.value,
                  options: options,
                  isBorder: isBorder,
                  isShortAnwser: isShortAnswer,
                  onChanged: (val) {
                    field.didChange(val);
                  },
                  disabled: state.enabled
                      ? disabled
                      : options.map((e) => e.value).toList(),
                  activeColor: activeColor,
                  focusColor: focusColor,
                  checkColor: checkColor,
                  materialTapTargetSize: materialTapTargetSize,
                  hoverColor: hoverColor,
                  tristate: tristate,
                  wrapAlignment: wrapAlignment,
                  wrapCrossAxisAlignment: wrapCrossAxisAlignment,
                  wrapDirection: wrapDirection,
                  wrapRunAlignment: wrapRunAlignment,
                  wrapRunSpacing: wrapRunSpacing,
                  wrapSpacing: wrapSpacing,
                  wrapTextDirection: wrapTextDirection,
                  wrapVerticalDirection: wrapVerticalDirection,
                  separator: separator,
                  controlAffinity: controlAffinity,
                ),
                isDetail == true ? const SizedBox(height: 10) : Container(),
                isDetail == true
                    ? Container(
                        margin: const EdgeInsets.only(bottom: 5),
                        child: Padding(
                          padding: const EdgeInsets.all(0),
                          child: TextboxField(
                            maxLines: 5,
                            minLines: 1,
                            maxLength: 200,
                            name: textBoxName ?? 'detail',
                            title: 'Chi tiết',
                            placeholder: 'Vui lòng nhập rõ chi tiết',
                            isRequired: isRequired,
                          ),
                        ),
                      )
                    : Container()
              ],
            );
          },
        );

  @override
  _QuestionCheckBoxFieldState<T> createState() =>
      _QuestionCheckBoxFieldState<T>();
}

class _QuestionCheckBoxFieldState<T>
    extends FormBuilderFieldState<QuestionCheckBoxField<T>, List<T>> {
  @override
  void didChange(List<T>? val) {
    super.didChange(val);
  }
}
