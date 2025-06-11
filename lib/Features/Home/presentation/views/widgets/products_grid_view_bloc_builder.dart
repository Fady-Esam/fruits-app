import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/widgets/custom_error_widget.dart';
import '../../manager/cubits/product_cubit/product_cubit.dart';
import '../../manager/cubits/product_cubit/product_state.dart';
import 'products_grid_view.dart';

class ProductsGridViewBlocBuilder extends StatelessWidget {
  const ProductsGridViewBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        if (state is ProductsSuccessState) {
          return ProductsGridView(
            products: state.products,
          );
        } else if (state is ProductsFailureState) {
          return SliverToBoxAdapter(
            child: CustomErrorWidget(
              text: state.errMessage,
            ),
          );
        } else {
          return Skeletonizer.sliver(
            enabled: true,
            child: ProductsGridView(
              products: [],
            ),
          );
        }
      },
    );
  }
}
