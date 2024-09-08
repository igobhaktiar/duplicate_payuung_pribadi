import 'package:duplicate_payuung_pribadi/domain/entities/voucher_entities.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final _dayTime = 'Selamat Malam'.obs;
  final _time = DateTime.now().obs;
  var selectedIndex = 0.obs;

  List<VoucherEntities> dummyVouchers = [
    VoucherEntities(
      logo: 'assets/images/indomaret_logo.png',
      title: 'Voucher Digital Indomaret Rp 25.000',
      price: 25000,
    ),
    VoucherEntities(
      logo: 'assets/images/alfamart_logo.png',
      title: 'Voucher Digital Grab Transport Rp. 20.000',
      price: 20000,
    ),
    VoucherEntities(
      logo: 'assets/images/excelso_logo.png',
      title: 'Voucher Digital Excelso Rp. 50.000',
      price: 48000,
      originalPrice: 50000,
      discount: '4% OFF',
    ),
    VoucherEntities(
      logo: 'assets/images/grab_logo.png',
      title: 'Voucher Digital Grab Transport Rp. 50.000',
      price: 50000,
    ),
    VoucherEntities(
      logo: 'assets/images/bakmi_logo.jpeg',
      title: 'Voucher Digital Bakmi GM Rp. 100.000',
      price: 100000,
    ),
    VoucherEntities(
      logo: 'assets/images/hm_logo.png',
      title: 'Voucher Digital H&M Rp. 200.000',
      price: 200000,
    ),
  ];

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
