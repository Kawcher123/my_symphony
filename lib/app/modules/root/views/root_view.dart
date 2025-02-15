import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/root_controller.dart';
import '../../home/views/home_view.dart';
import '../widgets/custom_bottom_navbar.dart';

class RootView extends GetView<RootController> {
  const RootView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Obx(() => IndexedStack(
            index: controller.selectedIndex.value,
            children: const [
              Text(""),
              HomeView(),
              Text("")
            ],
          )),
      bottomNavigationBar: Obx(
        () => CustomBottomNavBar(
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: controller.changeIndex,
        ),
      ),
    );
  }
}
