import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:fruits_app/Features/Home/data/models/product_model.dart';

import 'package:fruits_app/core/errors/server_failure.dart';
import 'package:fruits_app/core/services/api_service.dart';

import '../../domain/repos/home_service.dart';

class HomeServiceImp implements HomeService {
  final ApiService apiService;

  HomeServiceImp({required this.apiService});

  @override
  Future<Either<ServerFailure, List<ProductModel>>>
      getBestSellingProducts() async {
    try {
      var result = await apiService.get(
        endPoint: "api/Home/get-best-selling-products",
      );
      var resultData = jsonDecode(result.body);
      log("Result ${resultData.toString()}");
      if (result.statusCode >= 400) {
        Map<String, dynamic> errors = resultData["errors"];
        return left(
            ServerFailure(errMessage: errors.values.toList().join("\n")));
      }
      List<ProductModel> products = [];
      var res = resultData["data"];
      for (var element in res) {
        products.add(ProductModel.fromJson(element));
      }

      return right(products);
    } catch (e) {
      return left(
          ServerFailure(errMessage: "Something went wrong, please try again."));
    }
  }

  @override
  Future<Either<ServerFailure, List<ProductModel>>> getProducts() async {
    try {
      var result = await apiService.get(
        endPoint: "api/Home/get-products",
      );
      var resultData = jsonDecode(result.body);
      //log("Result ${resultData.toString()}");
      if (result.statusCode >= 400) {
        Map<String, dynamic> errors = resultData["errors"];
        return left(
            ServerFailure(errMessage: errors.values.toList().join("\n")));
      }
      List<ProductModel> products = [];
      var res = resultData["data"];
      for (var element in res) {
        products.add(ProductModel.fromJson(element));
      }
      return right(products);
    } catch (e) {
      return left(
          ServerFailure(errMessage: "Something went wrong, please try again."));
    }
  }
}
