import 'package:pdf_maker/constants/routes.dart';

class AppMenus {
  static const List<AppMenu> homeMenu = [
    AppMenu.form,
    AppMenu.text,
    AppMenu.image,
    AppMenu.scan,
  ];
}

enum AppMenu {
  form("Form to PDF", "", Routes.formRoute),
  text("Text to PDF", "", Routes.writeRoute),
  image("Image to PDF", "", Routes.imageRoute),
  scan("Scan to PDF", "", Routes.scanRoute);


  final String title;
  final String icon;
  final String route;

  const AppMenu(this.title, this.icon, this.route);
}