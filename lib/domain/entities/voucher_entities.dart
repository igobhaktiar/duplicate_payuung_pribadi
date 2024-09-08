class VoucherEntities {
  final String logo;
  final String title;
  final int price;
  final int? originalPrice;
  final String? discount;

  VoucherEntities({
    required this.logo,
    required this.title,
    required this.price,
    this.originalPrice,
    this.discount,
  });
}
