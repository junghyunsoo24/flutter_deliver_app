import 'package:flutter/cupertino.dart';
import '../../common/component/pagination_list.view.dart';
import '../component/product_card.dart';
import '../model/product_model.dart';
import '../provider/product_provider.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PaginationListView<ProductModel>(
      provider: productProvider,
      itemBuilder: <ProductModel>(_, index, model){
        return ProductCard.fromProductModel(
          model: model,
        );
      },
    );
  }
}