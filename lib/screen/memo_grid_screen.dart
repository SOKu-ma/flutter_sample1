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
    return DefaultTabController(
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
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            showModalBottomSheet<void>(
              isDismissible: true,
              backgroundColor: Colors.transparent,
              isScrollControlled: true,
              context: context,
              builder: (BuildContext context) {
                return Container(
                  color: Colors.white,
                  margin: EdgeInsets.only(top: 70),
                  // decoration: (BoxDecoration(
                  //   //角丸にする
                  //   borderRadius: BorderRadius.only(
                  //     topLeft: Radius.circular(20),
                  //     topRight: Radius.circular(20),
                  //   ),
                  // )),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.all(20),
                          child: TextField(),
                        ),
                        ElevatedButton(
                          child: const Text('保存'),
                          onPressed: () => Navigator.pop(context),
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
