import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_sample2/screen/drawer_screen.dart';
import 'package:flutter_sample2/screen/memo_screen.dart';

class Home extends ConsumerWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              return showMakeTabDialog(context);
            },
            icon: const Icon(Icons.tab_outlined),
          ),
        ],
      ),
      drawer: const Drawer(child: DrawerMenu()),
      body: TabController(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }
}

class TabController extends StatelessWidget {
  final _tab = <Tab>[
    const Tab(text: 'Memo1'),
    const Tab(text: 'Memo2'),
    const Tab(text: 'Memo3'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(child: DrawerMenu()),
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
            children: [
              for (int i = 0; i < 3; i++)
                MemoPage(
                  tabName: i.toString(),
                )
            ],
          ),
        ),
      ),
    );
  }
}

// タブ編集用Dialog
showMakeTabDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (_) {
      return AlertDialog(
        content: const Text('タブを編集'),
        actions: [
          TextButton(
            onPressed: () async {
              try {} catch (e) {}
            },
            child: const Text('OK'),
          ),
        ],
      );
    },
  );
}
