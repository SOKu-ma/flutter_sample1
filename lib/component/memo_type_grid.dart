import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_sample2/ui/group_settings/group_settings_screen.dart';

class MemoGrid extends ConsumerWidget {
  const MemoGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var grid = [
      "memo1",
      "memo2",
      "memo3",
      "memo4",
      "memo1",
      "memo2",
      "memo3",
      "memo4"
    ];
    var gridColor = [
      Colors.lime,
      Colors.orangeAccent,
      Colors.lightBlueAccent,
      Colors.redAccent,
      Colors.green,
      Colors.pinkAccent,
      Colors.white,
      Colors.black12
    ];

    return Container(
      padding: const EdgeInsets.all(5),
      child: GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 1,
        childAspectRatio: 0.7,
        children: [
          for (int i = 0; i < grid.length; i++)
            _gridAnimation(i, grid[i], gridColor[i])
        ],
      ),
    );
  }

  // グリッドアニメーション
  Widget _gridAnimation(int index, String text, Color color) {
    return OpenContainer(
      transitionType: ContainerTransitionType.fadeThrough,
      closedElevation: 1,
      transitionDuration: const Duration(milliseconds: 800),
      closedBuilder: (BuildContext c, VoidCallback action) =>
          _gridCell(index, text, color),
      // openBuilder: (BuildContext c, VoidCallback action) => Padding(
      // child: _gridCell(index, text, color),
      // padding: const EdgeInsets.only(top: 50, bottom: 50)),
      // openBuilder: (BuildContext c, VoidCallback action) => Scaffold(
      //   appBar: AppBar(title: Text('aaa')),
      //   body: GroupSettings(),
      // ),
      openBuilder: (BuildContext c, VoidCallback action) => Scaffold(
        appBar: AppBar(title: Text('aaa')),
        body: _gridCell(index, text, color),
      ),
      // openShape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      tappable: true,
    );
  }

  Widget _gridCell(int index, String text, Color color) {
    return GridTile(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: color,
        ),
        alignment: Alignment.topLeft,
        padding: const EdgeInsets.only(left: 2, right: 2, top: 5),
        margin: const EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 10, top: 5),
                  height: 20,
                  width: 20,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.black),
                  child: const Center(
                    child: Text("S", style: (TextStyle(color: Colors.white))),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 15),
                  child: const Text("2022/02/02 18:00",
                      style: TextStyle(fontSize: 10)),
                ),
              ],
            ),
            Container(
              // color: Colors.red,
              margin: const EdgeInsets.only(left: 10, right: 10),
              child: const Text("タイトル", style: TextStyle(fontSize: 20)),
            ),
            const SizedBox(height: 5),
            Container(
              margin: const EdgeInsets.only(left: 10, right: 10),
              child: const Text("コンテンツ", style: TextStyle(fontSize: 14)),
            ),
            const SizedBox(height: 5),
            Container(
              margin: const EdgeInsets.only(left: 10, right: 10),
              child: Text(text, style: const TextStyle(fontSize: 14)),
            ),
          ],
        ),
      ),
    );
  }
}
