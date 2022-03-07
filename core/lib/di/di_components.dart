import 'package:core/helper/data_mapper.dart';
import 'package:get_it/get_it.dart';
import '../router/navigation_service.dart';

GetIt getIt = GetIt.instance;

void buildCoreDI() {
  // push NavigationService
  getIt.registerLazySingleton<NavigationService>(() => NavigationService());
  // push FirebaseAnalyticsHandler
  // push TrackingManager
  // push FileManager
  // firebase remote config
  getIt.registerLazySingleton<DataMapper>(() => DataMapper());
}
