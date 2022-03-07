import 'package:firebase_remote_config/firebase_remote_config.dart';

class FirebaseRemoteConfiguration {
  RemoteConfig remoteConfig = RemoteConfig.instance;

  String get appDomainProd {
    var value = remoteConfig.getString('app_domain_prod');
    return value.isEmpty ? 'https://34.124.245.21' : value;
  }

  String get appDomainStg {
    var value = remoteConfig.getString('app_domain_stg');
    return value.isEmpty ? 'https://34.124.245.21' : value;
  }

  String get pccovidStg {
    var value = remoteConfig.getString('pccovid_stg');
    return value.isEmpty ? 'https://apikbyt-uat.pccovid.gov.vn:6868' : value;
  }

  String get pccovidProd {
    var value = remoteConfig.getString('pccovid_prod');
    return value.isEmpty ? 'https://apikbyt-uat.pccovid.gov.vn:6868' : value;
  }
}
