import 'package:go_router/go_router.dart';
import 'package:order_app_demo/add_order/presentation/view/add_order_page.dart';
import 'package:order_app_demo/order_details/presentation/order_details_page.dart';
import 'package:order_app_demo/router/path_constants.dart';
import 'package:order_app_demo/signature/presentation/signature_page.dart';

var router = GoRouter(
  initialLocation: PathConstants.addOrder,
  routes: [
    GoRoute(
        path: PathConstants.addOrder,
        name: PathConstants.addOrder,
        pageBuilder: (context, state) => const NoTransitionPage(
              child: AddOrderPage(),
            ),
        routes: [
          GoRoute(
            path: PathConstants.signaturePage,
            name: PathConstants.signaturePage,
            pageBuilder: (context, state) => const NoTransitionPage(
              child: SignaturePage(),
            ),
          ),
        ]),
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
