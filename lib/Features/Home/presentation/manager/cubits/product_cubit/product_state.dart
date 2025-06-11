
import '../../../../data/models/product_model.dart';

class ProductState {}

class InitialProductState extends ProductState {}

class BestSellingProductsFailureState extends ProductState {
  final String errMessage;
  BestSellingProductsFailureState({required this.errMessage});
}

class BestSellingProductsSuccessState extends ProductState {
  final List<ProductModel> bestSellingProducts;
  BestSellingProductsSuccessState({required this.bestSellingProducts});
}

class BestSellingProductsLoadingState extends ProductState {}

class ProductsFailureState extends ProductState {
  final String errMessage;
  ProductsFailureState({required this.errMessage});
}

class ProductsSuccessState extends ProductState {
  final List<ProductModel> products;
  ProductsSuccessState({required this.products});
}

class ProductsLoadingState extends ProductState {}