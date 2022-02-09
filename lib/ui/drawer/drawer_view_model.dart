import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// final homeViewModelNotifierProvider = ChangeNotifierProvider((ref) =>
//     DrawerViewModel(ref, repository: ref.read(newsRepositoryProvider)));

final drawerViewModelStateNotifierProvider =
    StateNotifierProvider<DrawerViewModel, List<String>>(
        (ref) => DrawerViewModel());

class DrawerViewModel extends StateNotifier<List<String>> {
  DrawerViewModel() : super([]);
}
