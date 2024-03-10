import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_deliver_app/restaurant/view/restaurant_detail_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


import '../../common/const/data.dart';
import '../../common/dio/dio.dart';
import '../component/restaurant_card.dart';
import '../model/restaurant_model.dart';
import '../repository/restaurant_repository.dart';

class RestaurantScreen extends ConsumerWidget {
  const RestaurantScreen({Key? key}) : super(key: key);

  Future<List<RestaurantModel>> paginateRestaurant(WidgetRef ref) async {
    final dio = ref.watch(dioProvider);

    final resp =
    await RestaurantRepository(dio, baseUrl: 'http://$ip/restaurant')
        .paginate();

    return resp.data;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      child: Center(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: FutureBuilder<List<RestaurantModel>>(
              future: paginateRestaurant(ref),
              builder: (context, AsyncSnapshot<List<RestaurantModel>> snapshot) {
                if (!snapshot.hasData) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                return ListView.separated(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (_, index) {
                    final pItem = snapshot.data![index];

                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => RestaurantDetailScreen(
                              id: pItem.id,
                            ),
                          ),
                        );
                      },
                      child: RestaurantCard.fromModel(
                        model: pItem,
                      ),
                    );
                  },
                  separatorBuilder: (_, index) {
                    return const SizedBox(height: 16.0);
                  },
                );
              },
            )),
      ),
    );
  }
}