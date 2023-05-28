import 'package:flutter_riverpod/flutter_riverpod.dart';

class PageIndexNotifier extends StateNotifier<int> {
  PageIndexNotifier() : super(0);

  void changePage(int newPage) {
    state = newPage;
  }
}

final pageIndexProvider =
    StateNotifierProvider<PageIndexNotifier, int>((_) => PageIndexNotifier());
