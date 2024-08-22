class ProductModel {
  final String image;
  final String productName;
  final int price;
  final String info;
  final bool isNew;
  final int discountPercentage;

  ProductModel({
    required this.image,
    required this.productName,
    required this.price,
    required this.info,
    required this.isNew,
    required this.discountPercentage,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      image: json['image'],
      productName: json['productName'],
      price: json['price'],
      info: json['info'],
      isNew: json['isNew'],
      discountPercentage: json['discountPercentage'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'image': image,
      'productName': productName,
      'price': price,
      'info': info,
      'isNew': isNew,
      'discountPercentage': discountPercentage,
    };
  }
}
