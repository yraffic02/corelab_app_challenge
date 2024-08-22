import 'package:bloc/bloc.dart';
import 'package:corelab_app_challenge/blocs/products/product_event.dart';
import 'package:corelab_app_challenge/blocs/products/product_state.dart';
import 'package:corelab_app_challenge/model/product_model.dart';
import 'package:corelab_app_challenge/repositories/product_repository.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final _repository = ProductRepository();

  ProductBloc() : super(ProductInitialState()) {
    on(_mapEventToState);
  }

  void _mapEventToState(ProductEvent envet, Emitter emit) async {
    List<ProductModel> products = [];

    emit(ProductLoadingState());

    if (envet is GetProduct) {
      products = await _repository.getProducts();
    }

    if (envet is ResetProducts) {
      products = [];
    }

    if (envet is SearchProducts) {
      products = await _repository.searchProducts(envet.query);
    }

    emit(ProductLoadedState(products: products));
  }
}
