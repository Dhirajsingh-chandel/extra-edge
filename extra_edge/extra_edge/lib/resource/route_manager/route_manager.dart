import 'package:extra_edge/view/splash.dart';
import 'package:flutter/material.dart';
import '../../view/rocket_info.dart';
import '../../view/rockets_list.dart';
import '../string_manager.dart';


final navKey = GlobalKey<NavigatorState>();

class Routes {
  static const String splashPage = "/splashPage";
  static const String rocketPage = "/rocketList";
  static const String rocketInfo = "/rocketInfo";
}

class RoutesGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.rocketPage:
        return MaterialPageRoute(builder: (_) => const RocketPage());
      case Routes.rocketInfo:
        return MaterialPageRoute(builder: (_) => const RocketInfo());
      case Routes.splashPage:
        return MaterialPageRoute(builder: (_) => const SplashPage());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: const Text(AppString.noRouteFound),
              ),
              body: const Center(
                child: Text(AppString.noRouteFound),
              ),
            ));
  }
}
