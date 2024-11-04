import 'package:go_router/go_router.dart';
import 'package:order_app_demo/add_order/presentation/view/add_order_page.dart';
import 'package:order_app_demo/order_details/presentation/order_details_page.dart';
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
    GoRoute(
      path: PathConstants.orderDetails,
      name: PathConstants.orderDetails,
      pageBuilder: (context, state) => NoTransitionPage(
        child: OrderDetailsPage(
          customer: (state.extra as Map)["customer"],
          units: (state.extra as Map)["units"],
        ),
      ),
    ),
  ],
);
