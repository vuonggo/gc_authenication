import 'package:gc_core/gc_core.dart';
import 'package:get_it/get_it.dart';
import '../router/navigation_service.dart';

GetIt getIt = GetIt.instance;

void buildCoreDI() {
  // push NavigationService
  getIt.registerLazySingleton<NavigationService>(() => NavigationService());
}
