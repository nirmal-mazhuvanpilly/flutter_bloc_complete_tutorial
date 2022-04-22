import 'package:flutter_bloc_complete_tutorial/services/api_services.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> registerServices() async {
  getIt.registerLazySingleton<ApiServices>(() => ApiServices());
}
