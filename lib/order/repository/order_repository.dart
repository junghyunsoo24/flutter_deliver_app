import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retrofit/http.dart';
import 'package:dio/dio.dart' hide Headers;
import '../../common/const/data.dart';
import '../../common/dio/dio.dart';
import '../../common/model/cursor_pagination_model.dart';
import '../../common/model/pagination_params.dart';
import '../../common/repository/base_pagination_repository.dart';
import '../model/order_model.dart';
import '../model/post_order_body.dart';

part 'order_repository.g.dart';

final orderRepositoryProvider = Provider<OrderRepository>(
      (ref) {
    final dio = ref.watch(dioProvider);

    return OrderRepository(dio, baseUrl: 'http://$ip/order');
  },
);

// http://$ip/order
@RestApi()
abstract class OrderRepository implements IBasePaginationRepository<OrderModel> {
  factory OrderRepository(Dio dio, {String baseUrl}) = _OrderRepository;

  @override
  @GET('/')
  @Headers({
    'accessToken': 'true',
  })
  Future<CursorPagination<OrderModel>> paginate({
    @Queries() PaginationParams? paginationParams = const PaginationParams(),
  });

  @POST('/')
  @Headers({
    'accessToken': 'true',
  })
  Future<OrderModel> postOrder({
    @Body() required PostOrderBody body,
  });
}