import 'package:app_builder/helper/shared_prefrence_helper.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupDependencies() {
  getIt.registerSingleton<SharedPreferenceHelper>(SharedPreferenceHelper());
  // getIt.registerSingleton<PushNotificationService>(
  //     PushNotificationService(FirebaseMessaging()));
}
