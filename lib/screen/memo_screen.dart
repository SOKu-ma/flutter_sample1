import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MemoPage extends ConsumerWidget {
  MemoPage({Key? key, required this.tabName}) : super(key: key);
  final String tabName;

  var grid = ["memo1", "memo2", "memo3"];
  var gridColor = [
    Colors.lime,
    Colors.orangeAccent,
    Colors.lightBlueAccent,
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(5),
          // color: Colors.red,
          child: GridView.count(
            crossAxisCount: 2,
            children: [
              for (int i = 0; i < grid.length; i++)
                _gridCell(grid[i], gridColor[i])
              // Container(
              //   child: Text(grid[i]),
              // ),
            ],
          ),
          // child: GridView.builder(
          //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          //     crossAxisCount: 2,
          //   ),
          //   itemBuilder: (BuildContext context, int index) {
          //     if (index >= grid.length) {
          //       grid.addAll([
          //         "pic0",
          //         "pic1",
          //         "pic2",
          //         "pic3",
          //         "pic4",
          //         "pic5",
          //       ]);
          //     }
          //     return _gridCell(grid[index], gridColor[index]);
          //   },
          // ),
        ),
      ),
    );
  }

  Widget _gridCell(String text, Color color) {
    return Container(
      child: GridTile(
        child: Container(
          margin: EdgeInsets.all(10),
          color: color,
          // decoration: BoxDecoration(
          //   border: Border.all(color: Colors.green),
          // ),
          child: Column(
            children: [
              Center(
                child: Text("タイトル"),
              ),
              Center(
                child: Text("テキスト"),
              ),
              Center(
                child: Text(text),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
