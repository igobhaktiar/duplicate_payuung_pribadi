import 'package:duplicate_payuung_pribadi/presentation/bindings/bottom_nav_sheet_binding.dart';
import 'package:duplicate_payuung_pribadi/presentation/bindings/home_binding.dart';
import 'package:duplicate_payuung_pribadi/presentation/pages/main_page.dart';
import 'package:get/get.dart';

class AppRoutes {
  static const initial = '/';

  static final pages = [
    GetPage(
      name: initial,
      page: () => const MainPage(),
      bindings: [
        BottomNavSheetBinding(),
        HomeBinding(),
      ],
    ),
  ];
}
