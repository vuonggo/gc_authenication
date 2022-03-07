import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../generated_images.dart';

class MenuBottomSheet extends StatelessWidget {
  final String title;
  final List<MenuBottomSheetItem> items;
  const MenuBottomSheet({
    Key? key,
    required this.title,
    required this.items,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var paddingBottom = 20;
    var headerHeight = 24;
    return ConstrainedBox(
      constraints: BoxConstraints.tightForFinite(
          height: items.length * 62 +
              headerHeight +
              MediaQuery.of(context).padding.bottom +
              paddingBottom),
      child: Column(
        children: [
          Padding(
            padding: AppConsts.kMarginAll,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                      child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                    child: Text(
                      title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: CoreAppTheme.of(context).textTheme.headline2,
                    ),
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
          Expanded(
            flex: 1,
            child: Column(
              children: items,
            ),
          )
        ],
      ),
    );
  }

  void showBottomSheet(BuildContext context) async {
    return showModalBottomSheet(
        elevation: 1.0,
        useRootNavigator: false,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24), topRight: Radius.circular(24)),
        ),
        context: context,
        builder: (context) {
          return MenuBottomSheet(
            title: title,
            items: items,
          );
        });
  }
}

class MenuBottomSheetItem extends StatelessWidget {
  final ValueSetter<BuildContext> action;
  final String title;
  final Widget? image;
  const MenuBottomSheetItem({
    Key? key,
    required this.title,
    required this.action,
    this.image,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(0),
      child: InkWell(
        highlightColor: Colors.red,
        onTap: () {
          action.call(context);
        },
        child: Container(
            height: 56,
            padding: const EdgeInsets.symmetric(
                horizontal: AppConsts.padding, vertical: AppConsts.padding / 2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                image != null
                    ? Container(
                        margin: const EdgeInsets.only(right: 5),
                        height: 40,
                        width: 40,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: AppColors.transparent),
                        child: SizedBox(
                          height: 17,
                          width: 17,
                          child: image,
                        ),
                      )
                    : Container(),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    title,
                    style: const TextStyle(fontWeight: FontWeight.w400),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
