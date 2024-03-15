import 'package:flutter/material.dart';
import 'package:flutter_deliver_app/restaurant/view/restaurant_detail_screen.dart';
import 'package:go_router/go_router.dart';
import '../../common/component/pagination_list.view.dart';
import '../component/restaurant_card.dart';
import '../provider/restaurant_provider.dart';

class RestaurantScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PaginationListView(
      provider: restaurantProvider,
      itemBuilder: <RestaurantModel>(_, index, model) {
        return GestureDetector(
          onTap: () {
            context.goNamed(
              RestaurantDetailScreen.routeName,
              pathParameters: {
                'rid': model.id,
              },
            );
          },
          child: RestaurantCard.fromModel(
            model: model,
          ),
        );
      },
    );
  }
}