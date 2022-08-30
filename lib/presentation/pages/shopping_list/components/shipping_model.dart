class ShippingModel {
  final String title;
  final String? subTitle;
  final int count;
  final int price;
  final int weight;
  final int id;
  bool isDeleted = false;

  ShippingModel(
      {required this.title,
      this.subTitle,
      required this.isDeleted,
      required this.count,
      required this.price,
      required this.weight,
      required this.id});
}