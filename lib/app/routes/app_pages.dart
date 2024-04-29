import 'package:get/get.dart';

import '../modules/loggin/bindings/loggin_binding.dart';
import '../modules/loggin/views/loggin_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGGIN;

  static final routes = [
    GetPage(
      name: _Paths.LOGGIN,
      page: () => const LogginView(),
      binding: LogginBinding(),
    ),
  ];
}