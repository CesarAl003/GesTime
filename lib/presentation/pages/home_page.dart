import 'package:gestime/presentation/Providers/Navigation_provider.dart';
import 'package:gestime/presentation/pages/countdown_page.dart';
import 'package:gestime/presentation/pages/login_page.dart';
import 'package:gestime/presentation/pages/signup_page.dart';
import 'package:gestime/presentation/pages/note_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navigationProvider = Provider.of<NavigationBarProvider>(context);

    return HomePageView(navigationProvider: navigationProvider,);
  }
}

class HomePageView extends StatelessWidget {
  final NavigationBarProvider navigationProvider;

  const HomePageView({Key? key, required this.navigationProvider})
      : super(key: key);

  
  @override
  Widget build(BuildContext context) {
  List<dynamic> screens = [
        // Mis pestañas contenidas en el menu
        countDown(),
        Login(),
        SignUp(), // Prueba
        note(), // Prueba
      ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('GesTime'),
      ),
      bottomNavigationBar: NavigationBar(
        labelBehavior:  NavigationDestinationLabelBehavior.onlyShowSelected,
        selectedIndex: navigationProvider.fetchCurrentScreenIndex,
        elevation: 1.5,
        onDestinationSelected: (value) => navigationProvider.updateScreenIndex(value),
        destinations: <Widget>[
          NavigationDestination(
              label: '',
              icon: Icon((navigationProvider.fetchCurrentScreenIndex == 0)
                  ? Icons.timer
                  : Icons.timer_outlined),
              ),
          NavigationDestination(
            label: '',
            icon: Icon((navigationProvider.fetchCurrentScreenIndex == 1)
                ? Icons.book
                : Icons.book_outlined),
          ),
          NavigationDestination(
            label: '',
            icon: Icon((navigationProvider.fetchCurrentScreenIndex == 2)
                ? Icons.calendar_month
                : Icons.calendar_month_outlined),
          ),
          NavigationDestination(
            label: '',
            icon: Icon((navigationProvider.fetchCurrentScreenIndex == 3)
                ? Icons.person
                : Icons.person_outline),
          ),
        ],
      ),
      body: screens[navigationProvider.fetchCurrentScreenIndex],
    );
  }
}
