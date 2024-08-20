import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pdf_maker/pages/home.dart';

import '../pages/form_page.dart';
import '../pages/image_page.dart';
import '../pages/scan_page.dart';
import '../pages/text_page.dart';

class Routes {
  static const String splashRoute = "/";
  static const String home = "/home";
  static const String readRoute = "/read";
  static const String writeRoute = "/write";
  static const String editRoute = "/edit";
  static const String scanRoute = "/scan";
  static const String imageRoute = "/image";
  static const String formRoute = "/form";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.home:
        return MaterialPageRoute(builder: (_) => const HomePage());

      case Routes.formRoute:
        return MaterialPageRoute(builder: (_) => const FormPage());

      case Routes.readRoute:
        return MaterialPageRoute(builder: (_) => const HomePage());

      case Routes.writeRoute:
        return MaterialPageRoute(builder: (_) => const TextPage());

      case Routes.editRoute:
        return MaterialPageRoute(builder: (_) => const HomePage());

      case Routes.scanRoute:
        return MaterialPageRoute(builder: (_) => const ScanPage());

      case Routes.imageRoute:
        return MaterialPageRoute(builder: (_) => const ImagePage());

      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
          appBar: AppBar(
            title: const Text("No Route Found!"),
          ),
          body: const Center(
            child: Text("No Route Found!"),
          ),
        ));
  }
}