import 'package:flutter/material.dart';
import 'package:flutter_caselet/pages/alert_page.dart';
import 'package:flutter_caselet/pages/dashboard_page.dart';
import 'package:flutter_caselet/navigation_bar.dart' as lib;
import 'package:flutter_caselet/pages/tickets_page.dart';

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

  void handleNavigateToTicketPage() {
    setState(() {
      selectedPageIndex = 2;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = const [
      AlertPage(),
      DashboardPage(),
      TicketsPage(),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 10, 10, 20),
        child: Column(
          children: [
            Expanded(
              child: pages[selectedPageIndex],
            )
          ],
        ),
      ),
      bottomNavigationBar: lib.NavigationBar(handlePageChange),
    );
  }
}
