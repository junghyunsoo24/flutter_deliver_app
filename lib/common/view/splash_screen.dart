import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_deliver_app/common/view/root_tab.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../user/view/login_screen.dart';
import '../const/colors.dart';
import '../const/data.dart';
import '../layout/default_layout.dart';
import '../secure_storage/secure_storage.dart';

class SplashScreen extends ConsumerWidget {
  static String get routeName => 'splash';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultLayout(
      backgroundColor: PRIMARY_COLOR,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'asset/img/logo/logo.png',
              width: MediaQuery.of(context).size.width / 2,
            ),
            const SizedBox(height: 16.0),
            const CircularProgressIndicator(
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}