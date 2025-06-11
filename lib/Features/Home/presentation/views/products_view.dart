import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app/Features/Home/domain/repos/home_service.dart';

import '../../../../core/helpers/get_it_singleton_helper.dart';
import '../manager/cubits/product_cubit/product_cubit.dart';
import 'widgets/products_view_body.dart';

class ProductsView extends StatelessWidget {
  const ProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductCubit(
        homeService:getIt.get<HomeService>(),
      ),
      child: const ProductsViewBody(),
    );
  }
}
