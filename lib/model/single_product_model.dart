class SingleProductModel {
  String productName;
  String productImage;
  String productModel;
  double productPrice;
  double productOldPrice;
  String productSecondImage;
  String productThirdImage;
  String productFourImage;
  bool isselected;

  SingleProductModel({
    required this.productThirdImage,
    required this.productFourImage,
    required this.productImage,
    required this.productModel,
    required this.productName,
    required this.productOldPrice,
    required this.productPrice,
    required this.productSecondImage,
    this.isselected = false,
  });

  // bool get isselected => null;

  // bool get isselected => null;

  // bool get isselected => null;
}
