import 'package:get/get.dart';

class HomeController extends GetxController {
  final _dayTime = 'Selamat Malam'.obs;
  final _time = DateTime.now().obs;
  var selectedIndex = 0.obs;

  void changeTab(int index) {
    selectedIndex.value = index;
  }

  String get dayTime => _dayTime.value;

  void _updateTime() {
    _time.value = DateTime.now();
    if (_time.value.hour >= 0 && _time.value.hour < 12) {
      _dayTime.value = 'Selamat Pagi';
    } else if (_time.value.hour >= 12 && _time.value.hour < 18) {
      _dayTime.value = 'Selamat Siang';
    } else {
      _dayTime.value = 'Selamat Malam';
    }
  }

  @override
  void onInit() {
    _updateTime();
    super.onInit();
  }
}
