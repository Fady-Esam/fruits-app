import 'package:dartz/dartz.dart';
import 'package:fruits_app/core/errors/server_failure.dart';

import '../../data/models/product_model.dart';

abstract class HomeService {
  Future<Either<ServerFailure, List<ProductModel>>> getProducts();
  Future<Either<ServerFailure, List<ProductModel>>> getBestSellingProducts();
}
