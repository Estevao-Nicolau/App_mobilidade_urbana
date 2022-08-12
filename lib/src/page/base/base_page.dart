import 'package:app_mobilidade_urbana/src/page/home/home_page.dart';
import 'package:app_mobilidade_urbana/src/page/router/bus_route_page.dart';
import 'package:flutter/material.dart';

class BasePage extends StatefulWidget {
  BasePage({Key? key}) : super(key: key);

  @override
  State<BasePage> createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  int currentIndex = 0;
  final pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        children: const <Widget>[
          HomePage(),
          Bus_Route_Page(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            currentIndex = index;
            pageController.jumpToPage(index);
          });
        },
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.blueAccent,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white.withAlpha(200),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.compare_arrows_rounded),
            label: 'Rotas',
          ),
        ],
      ),
    );
  }
}
