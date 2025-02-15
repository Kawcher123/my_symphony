import 'package:get/get.dart';

import '../modules/check_support/bindings/check_support_binding.dart';
import '../modules/check_support/views/check_support_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/root/bindings/root_binding.dart';
import '../modules/root/views/root_view.dart';
import '../modules/specification/bindings/specification_binding.dart';
import '../modules/specification/views/specification_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.ROOT;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.ROOT,
      page: () => const RootView(),
      binding: RootBinding(),
    ),
    GetPage(
      name: _Paths.CHECK_SUPPORT,
      page: () => const CheckSupportView(),
      binding: CheckSupportBinding(),
    ),
    GetPage(
      name: _Paths.SPECIFICATION,
      page: () =>  SpecificationView(),
      binding: SpecificationBinding(),
    ),
  ];
}
