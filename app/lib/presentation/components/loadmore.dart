import 'package:gc_core/gc_core.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class LoadMoreFooter extends StatelessWidget {
  final LoadStatus? status;
  const LoadMoreFooter({Key? key, required this.status}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (status == LoadStatus.failed) {
      return Container(
          alignment: Alignment.center,
          child: const GradientText(
              widget: Text(
            'Tải thất bại',
            style: const TextStyle(color: Colors.white),
          )));
    }
    if (status == LoadStatus.loading || status == LoadStatus.idle) {
      return Container(
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            SizedBox(
              width: 30,
              height: 30,
              child: CircularProgressIndicator(
                color: AppColors.primary,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: GradientText(
                  widget: Text(
                'Đang tải xuống...',
                style: TextStyle(color: Colors.white),
              )),
            ),
          ],
        ),
      );
    }
    if (status == LoadStatus.noMore) {
      return Container(
          alignment: Alignment.center,
          child: const GradientText(
              widget: Text(
            'Không còn dữ liệu!',
            style: const TextStyle(color: Colors.white),
          )));
    }

    return Container();
  }
}
