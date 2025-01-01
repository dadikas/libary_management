import 'package:flutter/material.dart';
import 'package:libary_management/src/presentation/home/pages/history_page.dart';
import 'package:libary_management/src/presentation/home/pages/home_page.dart';
import 'package:libary_management/src/presentation/home/pages/messages_page.dart';
import 'package:libary_management/src/presentation/home/pages/setting_page.dart';

enum MainScreenIndex {
  history(number: 0),
  home(number: 1),
  message(number: 2),
  settings(number: 3);

  final int number;

  const MainScreenIndex({required this.number});
}

class MainPage extends StatefulWidget {
  final MainScreenIndex contentBody;
  const MainPage({super.key, required this.contentBody});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late int _selectedIndex = widget.contentBody.number;
  static const List<Widget> _widgetOptions = <Widget>[
    HistoryPage(),
    HomePage(),
    MessagesPage(),
    SettingPage(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: _widgetOptions.elementAt(_selectedIndex),
          bottomNavigationBar: BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.history),
                label: 'History',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.dashboard),
                label: 'Dashboard',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.message),
                label: 'Messages',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'Settings',
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Theme.of(context).colorScheme.primary,
            onTap: _onItemTapped,
            unselectedItemColor: Theme.of(context).colorScheme.onSecondary,
          ))
    ;
  }
}
