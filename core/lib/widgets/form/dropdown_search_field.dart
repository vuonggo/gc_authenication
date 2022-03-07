import 'package:core/widgets/independent/dropdown_bottomsheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:core/core.dart';

class DropDownSearchField<T> extends StatefulWidget {
  final T? initialValue;
  final String label;
  final String name;
  final List<DropdownBottomItem<T>> items;
  final bool isRequired;
  final bool showSearchBar;
  final String dropdownTitle;
  final ValueSetter<T>? onSelected;
  final GlobalKey<FormBuilderState>? formKey;
  final String? hintText;
  const DropDownSearchField(
      {Key? key,
      this.initialValue,
      required this.label,
      required this.dropdownTitle,
      required this.name,
      required this.items,
      this.isRequired = false,
      this.showSearchBar = true,
      this.onSelected,
      this.hintText,
      this.formKey})
      : super(key: key);
  @override
  _DropDownSearchFieldState<T> createState() => _DropDownSearchFieldState<T>();
}

class _DropDownSearchFieldState<T> extends State<DropDownSearchField<T>> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IgnorePointer(
          child: DropdownField(
            initialValue: widget.initialValue,
            title: widget.label,
            name: widget.name,
            isRequired: widget.isRequired,
            hint: widget.hintText != null
                ? Text(
                    widget.hintText ?? '',
                    style:
                        CoreAppTheme.of(context).textTheme.bodyText1?.copyWith(
                              fontWeight: FontWeight.normal,
                              color: AppColors.grey,
                            ),
                  )
                : null,
            items: widget.items
                .map((e) => DropdownMenuItem(
                      value: e.value,
                      child: Text(
                        e.text,
                        style: CoreAppTheme.of(context).textTheme.bodyText1,
                      ),
                    ))
                .toList(),
            validator: widget.isRequired ? Validator.required(context) : null,
          ),
        ),
        Positioned.fill(
            child: GestureDetector(
                onTap: () async {
                  if (widget.items.isNotEmpty) {
                    var item = await DropdownBottomSheet.show<T>(context,
                        items: widget.items,
                        title: widget.dropdownTitle,
                        showSearchBar: widget.showSearchBar);
                    var value = widget
                        .formKey?.currentState?.fields[widget.name]?.value;
                    if (item != null && value != item) {
                      widget.formKey?.currentState?.fields[widget.name]
                          ?.didChange(item);
                      if (widget.onSelected != null && value != item) {
                        widget.onSelected!(item);
                      }
                    }
                  }
                },
                child: Container(
                  color: Colors.transparent,
                )))
      ],
    );
  }
}
