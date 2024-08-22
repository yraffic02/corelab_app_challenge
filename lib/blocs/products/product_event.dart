abstract class ProductEvent {}

class GetProduct extends ProductEvent {}

class ResetProducts extends ProductEvent {}

class SearchProducts extends ProductEvent {
  final String query;

  SearchProducts({required this.query});
}
