class ShippingModel {
  final String title;
  final String? subTitle;
  final int count;
  final int price;
  final int weight;
  final int id;
  bool isCheck = false;
  bool isShowEdit = false;

  ShippingModel(
      {required this.title,
      this.subTitle,
      required this.isCheck,
      required this.isShowEdit,
      required this.count,
      required this.price,
      required this.weight,
      required this.id});
}
