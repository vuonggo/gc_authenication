import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gc_core/gc_core.dart';
import 'package:gc_core/l10n/generated/l10n.dart';

class Loader {
  static final Loader appLoader = Loader();

  ValueNotifier<bool> loading = ValueNotifier(false);
  ValueNotifier<bool> initial = ValueNotifier(true);
  void showLoading(bool show) {
    loading.value = show;
  }

  void showInitial(bool show) {
    initial.value = show;
  }
}

Future<void> showSupportNumber(BuildContext context, String title) async {
  var number = '0971778888';
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text(S.of(context).needSupport +
                  ' ' +
                  S.of(context).plsCall +
                  number),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () async {
              makeCall(number);
            },
            child: Text(S.of(context).call),
          ),
          TextButton(
            onPressed: () async {
              Navigator.pop(context);
            },
            child: Text(
              S.of(context).cancel,
              style: const TextStyle(color: AppColors.grey),
            ),
          ),
        ],
      );
    },
  );
}
