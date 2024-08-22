import 'package:corelab_app_challenge/model/product_model.dart';

abstract class ProductState {
  final List<ProductModel> products;

  ProductState({required this.products});
}

class ProductInitialState extends ProductState {
  ProductInitialState() : super(products: []);
}

class ProductLoadingState extends ProductState {
  ProductLoadingState() : super(products: []);
}

class ProductLoadedState extends ProductState {
  ProductLoadedState({required List<ProductModel> products})
      : super(products: products);
}
