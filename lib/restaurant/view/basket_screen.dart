import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common/layout/default_layout.dart';

class BasketScreen extends ConsumerWidget {
  static String get routeName => 'basket';

  const BasketScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const DefaultLayout(
      title: '장바구니',
      child: Column(),
    );
  }
}