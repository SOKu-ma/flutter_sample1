import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MemoSettingScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(left: 40, right: 40),
              margin: EdgeInsets.all(20),
              child: const TextField(
                decoration: InputDecoration(
                  labelText: "Category Name",
                  hintText: "Some Hint",
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 40, right: 40),
              margin: EdgeInsets.all(20),
              child: const TextField(
                decoration: InputDecoration(
                  labelText: "Category Name",
                  hintText: "Some Hint",
                ),
              ),
            ),
          ],
        ),
        // child: Center(
        //   child: Text("メモグループ設定画面"),
        // ),
      ),
    );
  }
}
