import 'package:flutter/foundation.dart';

void debug(dynamic content) {
  if (kDebugMode) {
    // ignore: avoid_print
    print(content);
  }
}
