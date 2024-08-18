import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pdf_maker/constants/app_constants.dart';
import 'package:pdf_maker/constants/routes.dart';

class MenuContainer extends StatefulWidget {
  const MenuContainer({super.key});

  @override
  State<MenuContainer> createState() => _MenuContainerState();
}

class _MenuContainerState extends State<MenuContainer> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: GridView.builder(
        itemCount: AppMenus.homeMenu.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // 2 items per row
          // mainAxisSpacing: 4.0,
          // crossAxisSpacing: 4.0,
          childAspectRatio: 1 / 1, // Adjust for 1:1 image and text below
        ),
        itemBuilder: (context, index) {
          var item = AppMenus.homeMenu[index];
          return InkWell(
            onTap: () {
              Navigator.pushNamed(
                context,
                item.route,
              );
            },
            child: Card(
              elevation: 8,
              child: Center(
                child: Text(item.title, style: const TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),),
              ),
            ),
          );
        },
      ),
    );
  }
}
