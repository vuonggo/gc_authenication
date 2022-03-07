import 'package:core/core.dart';

import 'package:flutter/material.dart';
import 'package:core/helper/loader.dart';

class LoaderOverlayScreen extends StatelessWidget {
  const LoaderOverlayScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: Loader.appLoader.loading,
      builder: (context, value, child) {
        if (value) {
          return Container(
            color: Colors.black54,
            child: const Center(
              child: CircularProgressIndicator(
                color: AppColors.primary,
              ),
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
