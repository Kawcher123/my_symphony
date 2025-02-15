import 'package:get/get.dart';
import 'package:momagictask/app/routes/app_pages.dart';

class CheckSupportController extends GetxController {
  //TODO: Implement CheckSupportController

  final count = 0.obs;
  final List<Map<String, String>> supportItems = [
    {'icon': 'assets/icons/call.png', 'title': 'Hotline','route':''},
    {'icon': 'assets/icons/sc.png', 'title': 'Service Center','route':''},
    {'icon': 'assets/icons/lso.png', 'title': 'LSO Query','route':Routes.LSO_QUERY},
    {'icon': 'assets/icons/fd.png', 'title': 'Feedback','route':''},
    {'icon': 'assets/icons/sp.png', 'title': 'Specification','route':Routes.SPECIFICATION},
    {'icon': 'assets/icons/booking.png', 'title': 'Book An Appointment','route':''},
  ];
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

}
