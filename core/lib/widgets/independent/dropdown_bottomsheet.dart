import 'package:diacritic/diacritic.dart';
import 'package:core/l10n/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:core/generated_images.dart';
import 'package:core/styles/styles.dart';
import 'package:sizer/sizer.dart';
import 'seperator.dart';

class DropdownBottomItem<T> {
  final String text;
  final T value;
  const DropdownBottomItem({required this.text, required this.value});
}

class DropdownBottomSheet<T> extends StatefulWidget {
  static Future<T?> show<T>(BuildContext context,
      {required List<DropdownBottomItem> items,
      required String title,
      bool showSearchBar = true,
      Widget Function(DropdownBottomItem)? builder}) async {
    return showModalBottomSheet(
        elevation: 1.0,
        useRootNavigator: true,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24), topRight: Radius.circular(24)),
        ),
        context: context,
        builder: (context) {
          return DropdownBottomSheet<T>(
              title: title,
              items: items,
              showSearchBox: showSearchBar,
              builder: builder);
        });
  }

  final List<DropdownBottomItem> items;
  final String title;
  final bool showSearchBox;
  final Widget Function(DropdownBottomItem)? builder;
  const DropdownBottomSheet(
      {Key? key,
      required this.items,
      required this.title,
      this.showSearchBox = true,
      this.builder})
      : super(key: key);

  @override
  _DropdownBottomSheetState createState() => _DropdownBottomSheetState();
}

class _DropdownBottomSheetState extends State<DropdownBottomSheet> {
  List<DropdownBottomItem> _temp = [];

  @override
  void initState() {
    super.initState();
    _temp = widget.items;
  }

  void onChangedText(String value) {
    setState(() {
      _temp = value.isEmpty
          ? widget.items
          : widget.items
              .where((element) => removeDiacritics(element.text)
                  .toLowerCase()
                  .contains(removeDiacritics(value).toLowerCase()))
              .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    var itemHeight = 30 + AppConsts.padding;
    const maxHeight = 450.0;
    var headerHeight = widget.showSearchBox ? 80.0 : 30.0;
    var totalHeight =
        (widget.items.length * itemHeight) + headerHeight + itemHeight * 2;
    return Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: ConstrainedBox(
            constraints: BoxConstraints.tightForFinite(
                height: totalHeight > maxHeight ? maxHeight : totalHeight),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  child: Padding(
                    padding: AppConsts.kMarginAll,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                              child: Text(
                            widget.title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: CoreAppTheme.of(context).textTheme.bodyText2,
                          )),
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: SizedBox(
                              height: 16,
                              width: 16,
                              child: SvgPicture.asset(
                                Ic.closeIc,
                              ),
                            ),
                          )
                        ]),
                  ),
                ),
                if (widget.showSearchBox)
                  Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: AppConsts.padding),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(11),
                          border: Border.all(color: AppColors.borderColor)),
                      height: 54,
                      child: FormBuilderTextField(
                        style:
                            const TextStyle(fontSize: AppSizes.textNormalSize),
                        name: 'search',
                        onChanged: (value) {
                          if (value != null) {
                            onChangedText(value);
                          }
                        },
                        decoration: InputDecoration(
                            prefixIcon: SizedBox(
                              width: 30,
                              height: 100.h,
                              child: const Icon(Icons.search,
                                  color: Colors.grey, size: 24),
                            ),
                            border: InputBorder.none,
                            hintText: S.of(context).findByName,
                            contentPadding: const EdgeInsets.all(20)),
                      )),
                if (widget.showSearchBox)
                  const SizedBox(
                    height: AppConsts.padding / 2,
                  ),
                Expanded(
                    flex: 1,
                    child: Container(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: SingleChildScrollView(
                        child: _buildListItems(),
                      ),
                    ))
              ],
            )));
  }

  Widget _buildListItems() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: _temp
          .map((e) => InkWell(
                onTap: () {
                  Navigator.pop(context, e.value);
                },
                child: widget.builder != null
                    ? widget.builder!(e)
                    : Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: AppConsts.padding,
                            vertical: AppConsts.padding / 2),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              height: 30,
                              alignment: Alignment.centerLeft,
                              child: Text(
                                e.text,
                                style: CoreAppTheme.of(context)
                                    .textTheme
                                    .bodyText1
                                    ?.copyWith(fontSize: 16),
                              ),
                            ),
                            const Seperator(),
                          ],
                        )),
              ))
          .toList(),
    );
  }
}
