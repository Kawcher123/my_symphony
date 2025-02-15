import 'package:get/get.dart';

import '../controllers/specification_controller.dart';

class SpecificationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SpecificationController>(
      () => SpecificationController(),
    );
  }
}
