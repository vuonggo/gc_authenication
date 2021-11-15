import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:gc_core/gc_core.dart';
import 'dropdown_field.dart';

class GeoDropdown<T> extends StatefulWidget {
  final T? initialValue;
  final String label;
  final String name;
  final List<GeoBottomItem<T>> items;
  final bool isRequired;
  final bool showSearchBar;
  final String dropdownTitle;
  final ValueSetter<T>? onSelected;
  final GlobalKey<FormBuilderState>? formKey;
  const GeoDropdown(
      {Key? key,
      this.initialValue,
      required this.label,
      required this.dropdownTitle,
      required this.name,
      required this.items,
      this.isRequired = true,
      this.showSearchBar = true,
      this.onSelected,
      this.formKey})
      : super(key: key);
  @override
  _GeoDropdownState<T> createState() => _GeoDropdownState<T>();
}

class _GeoDropdownState<T> extends State<GeoDropdown<T>> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IgnorePointer(
          child: DropdownField(
            initialValue: widget.initialValue,
            title: widget.label,
            name: widget.name,
            items: widget.items
                .map((e) => DropdownMenuItem(
                      value: e.value,
                      child: Text(e.text),
                    ))
                .toList(),
            validator: widget.isRequired ? Validator.required(context) : null,
          ),
        ),
        Positioned.fill(
            child: GestureDetector(
                onTap: () async {
                  if (widget.items.isNotEmpty) {
                    var item = await GeoBottomSheet.show<T>(context,
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
