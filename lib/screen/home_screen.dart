import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_sample2/component/memo_type_list.dart';
import 'package:flutter_sample2/screen/drawer_screen.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

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
      body: MemoList(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {},
      ),
      // bottomNavigationBar: BottomAppBar(
      //   child: Container(
      //     color: Colors.lime,
      //     height: 50,
      //   ),
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
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
