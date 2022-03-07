import 'package:diacritic/diacritic.dart';
import 'package:core/l10n/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:core/generated_images.dart';
import 'package:core/styles/styles.dart';
import 'package:sizer/sizer.dart';
import 'seperator.dart';

class GeoBottomItem<T> {
  final String text;
  final T value;
  const GeoBottomItem({required this.text, required this.value});
}

class GeoBottomSheet<T> extends StatefulWidget {
  static Future<T?> show<T>(BuildContext context,
      {required List<GeoBottomItem> items,
      required String title,
      bool showSearchBar = true,
      Widget Function(GeoBottomItem)? builder}) async {
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
          return GeoBottomSheet<T>(
              title: title,
              items: items,
              showSearchBox: showSearchBar,
              builder: builder);
        });
  }

  final List<GeoBottomItem> items;
  final String title;
  final bool showSearchBox;
  final Widget Function(GeoBottomItem)? builder;
  const GeoBottomSheet(
      {Key? key,
      required this.items,
      required this.title,
      this.showSearchBox = true,
      this.builder})
      : super(key: key);

  @override
  _GeoBottomSheetState createState() => _GeoBottomSheetState();
}

class _GeoBottomSheetState extends State<GeoBottomSheet> {
  List<GeoBottomItem> _temp = [];

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
    var itemHeight = 80;
    const maxHeight = 450.0;
    var headerHeight = widget.showSearchBox ? 80.0 : 30.0;
    var totalHeight = (widget.items.length * itemHeight) + headerHeight;
    return Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: ConstrainedBox(
            constraints: BoxConstraints.tightForFinite(
                height: totalHeight > maxHeight ? maxHeight : totalHeight),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: AppConsts.kMarginAll,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                            child: Text(widget.title,
                                maxLines: 1, overflow: TextOverflow.ellipsis)),
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
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                e.text,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            const SizedBox(
                              height: AppConsts.padding,
                            ),
                            const Seperator()
                          ],
                        )),
              ))
          .toList(),
    );
  }
}
