import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:core/core.dart';
import 'package:core/widgets/form/singlechoice_item_views.dart';

import 'textbox_field.dart';

/// Field to select one value from a list of Radio Widgets
class QuestionSinglechoiceField<T> extends FormBuilderField<T> {
  final List<FormBuilderFieldOption<T>> options;
  final Color? activeColor;
  final Color? focusColor;
  final Color? hoverColor;
  final List<T>? disabled;
  final MaterialTapTargetSize? materialTapTargetSize;
  final Axis wrapDirection;
  final WrapAlignment wrapAlignment;
  final double wrapSpacing;
  final WrapAlignment wrapRunAlignment;
  final double wrapRunSpacing;
  final WrapCrossAlignment wrapCrossAxisAlignment;
  final TextDirection? wrapTextDirection;
  final VerticalDirection wrapVerticalDirection;
  final ControlAffinity controlAffinity;
  final OptionsOrientation orientation;
  final String? questionMsg;
  final String? hintQuestionMsg;
  final bool? isRequired;
  final bool? isDetail;
  final bool? isSubQuestion;
  final bool? isBorder;
  final String? textBoxName;

  /// Creates field to select one value from a list of Radio Widgets
  QuestionSinglechoiceField(
      {Key? key,
      //From Super
      required String name,
      FormFieldValidator<T>? validator,
      T? initialValue,
      InputDecoration decoration = const InputDecoration(),
      ValueChanged<T?>? onChanged,
      ValueTransformer<T?>? valueTransformer,
      bool enabled = true,
      FormFieldSetter<T>? onSaved,
      AutovalidateMode autovalidateMode = AutovalidateMode.disabled,
      VoidCallback? onReset,
      FocusNode? focusNode,
      required this.options,
      this.activeColor,
      this.focusColor,
      this.hoverColor,
      this.disabled,
      this.materialTapTargetSize,
      this.wrapDirection = Axis.horizontal,
      this.wrapAlignment = WrapAlignment.start,
      this.wrapSpacing = 10.0,
      this.wrapRunAlignment = WrapAlignment.start,
      this.wrapRunSpacing = 10.0,
      this.wrapCrossAxisAlignment = WrapCrossAlignment.start,
      this.wrapTextDirection,
      this.wrapVerticalDirection = VerticalDirection.down,
      this.controlAffinity = ControlAffinity.leading,
      this.orientation = OptionsOrientation.wrap,
      this.questionMsg,
      this.hintQuestionMsg,
      this.isRequired,
      this.isDetail,
      this.isSubQuestion,
      this.isBorder = true,
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
          focusNode: focusNode,
          decoration: decoration,
          builder: (FormFieldState<T?> field) {
            final state = field as _QuestionSinglechoiceFieldState<T>;
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
                                text: isRequired == null ? ' *' : '',
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
                const SizedBox(height: 10),
                SingleChoiceItemsView<T>(
                  orientation: orientation,
                  value: state.value,
                  options: options,
                  onChanged: (val) {
                    state.didChange(val);
                  },
                  disabled: state.enabled
                      ? disabled
                      : options.map((e) => e.value).toList(),
                  activeColor: activeColor,
                  focusColor: focusColor,
                  materialTapTargetSize: materialTapTargetSize,
                  hoverColor: hoverColor,
                  wrapAlignment: wrapAlignment,
                  wrapCrossAxisAlignment: wrapCrossAxisAlignment,
                  wrapDirection: wrapDirection,
                  wrapRunAlignment: wrapRunAlignment,
                  wrapRunSpacing: wrapRunSpacing,
                  wrapSpacing: wrapSpacing,
                  wrapTextDirection: wrapTextDirection,
                  wrapVerticalDirection: wrapVerticalDirection,
                  controlAffinity: controlAffinity,
                  isBorder: isBorder,
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
                            isRequired: true,
                          ),
                        ),
                      )
                    : Container(),
              ],
            );
          },
        );

  @override
  _QuestionSinglechoiceFieldState<T> createState() =>
      _QuestionSinglechoiceFieldState<T>();
}

class _QuestionSinglechoiceFieldState<T>
    extends FormBuilderFieldState<QuestionSinglechoiceField<T>, T> {}
