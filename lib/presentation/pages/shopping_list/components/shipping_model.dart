class ShippingModel {
  final String title;
  final String? subTitle;
  final String? weight;
  final String? subWeight;
  final int id;
  bool isCheck = false;
  bool isShowEdit = false;

  ShippingModel(
      {required this.title,
      this.subTitle,
      required this.isCheck,
      required this.isShowEdit,
      required this.weight,
      this.subWeight,
      required this.id});
}
