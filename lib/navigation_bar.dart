import 'dart:ui';

import 'package:flutter/material.dart';

class NavigationBar extends StatefulWidget {
  final Function onChangePage;
  const NavigationBar(this.onChangePage, {super.key});

  @override
  State<NavigationBar> createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.warning),
          label: 'Alerts',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.dashboard),
          label: 'Dashboard',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.menu),
          label: 'Tickets',
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.green[600] as Color,
      onTap: (int index) {
        setState(() {
          _selectedIndex = index;
        });
        widget.onChangePage(_selectedIndex);
      },
    );
  }
}
