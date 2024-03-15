import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../common/component/pagination_list.view.dart';
import '../../restaurant/view/restaurant_detail_screen.dart';
import '../component/product_card.dart';
import '../model/product_model.dart';
import '../provider/product_provider.dart';

class ProductScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PaginationListView<ProductModel>(
      provider: productProvider,
      itemBuilder: <ProductModel>(_, index, model) {
        return GestureDetector(
          onTap: () {
            context.goNamed(RestaurantDetailScreen.routeName, pathParameters: {
              'rid': model.restaurant.id,
            });
          },
          child: ProductCard.fromProductModel(
            model: model,
          ),
        );
      },
    );
  }
}