import 'package:get/get.dart';
import 'package:momagictask/app/modules/home/controllers/home_controller.dart';
import '../controllers/root_controller.dart';

class RootBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<HomeController>(HomeController(), permanent: true);
    Get.put<RootController>(RootController(), permanent: true);
  }
}
