import 'package:flutter/foundation.dart';
import 'firebase_remote_config.dart';

class Env {
  static String get appDomain {
    var remote = FirebaseRemoteConfiguration();
    return kDebugMode ? remote.appDomainStg : remote.appDomainProd;
  }

  static String get pccovidDomain {
    var remote = FirebaseRemoteConfiguration();
    return kDebugMode ? remote.pccovidStg : remote.pccovidProd;
  }
}
