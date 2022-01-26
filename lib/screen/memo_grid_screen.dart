import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_sample2/component/memo_type_grid.dart';

class MemoPage extends ConsumerWidget {
  MemoPage({Key? key}) : super(key: key);

  var grid = ["memo1", "memo2", "memo3"];
  var gridColor = [
    Colors.lime,
    Colors.orangeAccent,
    Colors.lightBlueAccent,
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(),
      body: TabMenuController(),
    );
  }
}

class TabMenuController extends StatelessWidget {
  final _tab = <Tab>[
    const Tab(text: 'Memo1'),
    const Tab(text: 'Memo2'),
    const Tab(text: 'Memo3'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: _tab.length,
        initialIndex: 0,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: AppBar(
              bottom: TabBar(
                tabs: _tab,
                isScrollable: true,
                indicatorSize: TabBarIndicatorSize.tab,
              ),
            ),
          ),
          body: TabBarView(
            children: [for (int i = 0; i < 3; i++) MemoGrid()],
          ),
        ),
      ),
    );
  }
}
