import 'package:flutter/foundation.dart';

class Env {
  static String get portalDomain {
    return kDebugMode
        ? 'https://galaxycare-sandbox.dev.nuclent.com'
        : 'https://galaxycare.dev.nuclent.com'; // TODO: switch to Prod
  }
}
