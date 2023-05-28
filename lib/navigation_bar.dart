import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'providers/page_index_provider.dart';

// class NavigationBar extends StatefulWidget {
//   final Function onChangePage;
//   const NavigationBar(this.onChangePage, {super.key});

//   @override
//   State<NavigationBar> createState() => _NavigationBarState();
// }

class NavigationBar extends ConsumerWidget {
  const NavigationBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int pageIndex = ref.watch(pageIndexProvider);

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
      currentIndex: pageIndex,
      selectedItemColor: Colors.green[600] as Color,
      onTap: (int index) {
        ref.read(pageIndexProvider.notifier).changePage(index);
      },
    );
  }
}
