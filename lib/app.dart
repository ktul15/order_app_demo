import 'package:flutter/material.dart';
import 'package:order_app_demo/router/router.dart';
import 'package:order_app_demo/utils/app_colors.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Todo App POC',
      theme: ThemeData(
          appBarTheme: const AppBarTheme(
        backgroundColor: AppColor.primaryColor,
      )),
      routeInformationParser: router.routeInformationParser,
      routeInformationProvider: router.routeInformationProvider,
      routerDelegate: router.routerDelegate,
    );
  }
}
