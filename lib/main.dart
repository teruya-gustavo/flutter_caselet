import 'package:flutter/material.dart';
import 'package:flutter_caselet/alert_page.dart';
import 'package:flutter_caselet/dashboard_page.dart';
import 'package:flutter_caselet/navigation_bar.dart' as lib;
import 'package:flutter_caselet/tickets_page.dart';

import 'navigation_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Downtime Prevention App',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(title: 'Downtime Prevention App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedPageIndex = 0;

  void handlePageChange(int id) {
    setState(() {
      selectedPageIndex = id;
    });
  }

  List<Widget> pages = [
    const AlertPage(),
    const DashboardPage(),
    const TicketsPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[pages[selectedPageIndex]],
        ),
      ),
      bottomNavigationBar: lib.NavigationBar(handlePageChange),
    );
  }
}
