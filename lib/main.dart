import 'package:flutter/material.dart';
import 'package:flutter_caselet/pages/alert/alert_page.dart';
import 'package:flutter_caselet/pages/dashboard/dashboard_page.dart';
import 'package:flutter_caselet/navigation_bar.dart' as lib;
import 'package:flutter_caselet/pages/tickets/tickets_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'providers/page_index_provider.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
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
      home: const MyHomePage2('Downtime Prevention App'),
    );
  }
}

class MyHomePage2 extends ConsumerWidget {
  final String title;
  const MyHomePage2(this.title, {super.key});

  final List<Widget> pages = const [
    AlertPage(),
    DashboardPage(),
    TicketsPage(),
  ];
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int pageIndex = ref.watch(pageIndexProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 10, 10, 20),
        child: Column(
          children: [
            Expanded(
              child: pages[pageIndex],
            )
          ],
        ),
      ),
      bottomNavigationBar: const lib.NavigationBar(),
    );
  }
}
