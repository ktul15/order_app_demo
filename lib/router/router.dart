import 'package:go_router/go_router.dart';
import 'package:order_app_demo/add_order/presentation/view/add_order_page.dart';
import 'package:order_app_demo/router/path_constants.dart';

var router = GoRouter(
  initialLocation: PathConstants.addOrder,
  routes: [
    GoRoute(
      path: PathConstants.addOrder,
      name: PathConstants.addOrder,
      pageBuilder: (context, state) => const NoTransitionPage(
        child: AddOrderPage(),
      ),
    ),
  ],
);
