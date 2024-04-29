import 'package:get/get.dart';

import '../controllers/loggin_controller.dart';

class LogginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LogginController>(
      () => LogginController(),
    );
  }
}
