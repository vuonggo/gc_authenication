import 'package:core/l10n/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:core/core.dart';

class LoadMoreFooter extends StatelessWidget {
  final LoadStatus? status;
  const LoadMoreFooter({Key? key, required this.status}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (status == LoadStatus.failed) {
      return Container(
          alignment: Alignment.center,
          child: GradientText(
              widget: Text(
            S.of(context).loadFailed,
            style: CoreAppTheme.of(context).textTheme.bodyText2?.copyWith(
                color: AppColors.neutral200, fontWeight: FontWeight.normal),
          )));
    }
    if (status == LoadStatus.loading || status == LoadStatus.idle) {
      return Container(
        height: 50,
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                color: AppColors.neutral200,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GradientText(
                  widget: Text(
                S.of(context).loadMore,
                style: CoreAppTheme.of(context).textTheme.bodyText2?.copyWith(
                    color: AppColors.neutral200, fontWeight: FontWeight.normal),
              )),
            ),
          ],
        ),
      );
    }
    if (status == LoadStatus.noMore) {
      return Container(
          alignment: Alignment.center,
          height: 50,
          child: GradientText(
              widget: Text(
            S.of(context).noMoreData,
            style: CoreAppTheme.of(context).textTheme.bodyText2?.copyWith(
                color: AppColors.neutral200, fontWeight: FontWeight.normal),
          )));
    }

    return Container();
  }
}
