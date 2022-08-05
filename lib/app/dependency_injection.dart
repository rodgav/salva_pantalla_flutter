import 'package:get_it/get_it.dart';
import 'package:salva_pantalla/app/inactivity_service.dart';

final instance = GetIt.instance;

Future<void> initModule() async {
  instance.registerLazySingleton<InactivityService>(() => InactivityService());
}
