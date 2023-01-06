import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:paras_test/router/router.gr.dart';

import '../component/text.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<StatefulWidget> createState() => _DashboardPageState();

}

class _DashboardPageState extends State<DashboardPage> {

  var _selectedPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: const AutoRouter(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPageIndex,
        onTap: (index) {
          switch(index) {
            case 0 :
              context.router.navigate(const HomeRoute());
              break;
            case 1 :
              context.router.navigate(const FavoriteRoute());
              break;
            case 2 :
              context.router.navigate(const AccountRoute());
              break;
          }

          setState(() {
            _selectedPageIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: 'Home'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorite'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Account'
          )
        ],
      ),
    );
  }
}