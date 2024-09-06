import 'package:duplicate_payuung_pribadi/presentation/controller/bottom_nav_sheet_controller.dart';
import 'package:get/get.dart';

class BottomNavSheetBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BottomNavSheetController>(() => BottomNavSheetController());
  }
}
