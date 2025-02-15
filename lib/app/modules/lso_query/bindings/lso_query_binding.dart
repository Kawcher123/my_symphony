import 'package:get/get.dart';

import '../controllers/lso_query_controller.dart';

class LsoQueryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LsoQueryController>(
      () => LsoQueryController(),
    );
  }
}
