import 'package:corelab_app_challenge/model/product_model.dart';

class ProductRepository {
  final List<ProductModel> _products = [
    ProductModel(
      image: 'lib/assets/img2.png',
      productName: 'Condicionador Ácido Fortificante 37% - AlPrime',
      price: 2900,
      info: 'em até 12x de R\$ 24,17',
      isNew: true,
      discountPercentage: 0,
    ),
    ProductModel(
      image: 'lib/assets/img1.png',
      productName: 'Condicionador Ácido Fosfórico 37% - AllPrime',
      price: 3000,
      info: 'em até 12x de R\$ 249,00',
      isNew: false,
      discountPercentage: 10,
    ),
  ];

  Future<List<ProductModel>> getProducts() async {
    return Future.delayed(const Duration(seconds: 2), () => _products);
  }

  Future<List<ProductModel>> searchProducts(String query) {
    return Future.delayed(
        const Duration(seconds: 2),
        () => _products.where((product) {
              return product.productName
                  .toLowerCase()
                  .contains(query.toLowerCase());
            }).toList());
  }
}
