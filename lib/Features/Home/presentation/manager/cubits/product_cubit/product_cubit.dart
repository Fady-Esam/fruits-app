import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app/Features/Home/domain/repos/home_service.dart';

import 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit({required this.homeService})
      : super(InitialProductState());
  final HomeService homeService;

  Future<void> getProducts() async{
    emit(ProductsLoadingState());
    var res = await homeService.getProducts();
    res.fold((fail) => emit(ProductsFailureState(errMessage: fail.errMessage)),
        (p) => emit(ProductsSuccessState(products: p)));
  }
  Future<void> getBestSellingProducts() async{
    emit(BestSellingProductsLoadingState());
    var res = await homeService.getBestSellingProducts();
    res.fold((fail) => emit(BestSellingProductsFailureState(errMessage: fail.errMessage)),
        (p) => emit(BestSellingProductsSuccessState(bestSellingProducts: p)));
  }
}
