import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MemoGrid extends ConsumerWidget {
  const MemoGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var grid = ["memo1", "memo2", "memo3"];
    var gridColor = [
      Colors.lime,
      Colors.orangeAccent,
      Colors.lightBlueAccent,
    ];

    return Container(
      padding: const EdgeInsets.all(5),
      child: GridView.count(
        crossAxisCount: 2,
        children: [
          for (int i = 0; i < grid.length; i++)
            _gridCell(i, grid[i], gridColor[i])
        ],
      ),
    );
  }

  Widget _gridCell(int index, String text, Color color) {
    return GestureDetector(
      onTap: () {
        print(index);
      },
      child: GridTile(
        child: Container(
          margin: EdgeInsets.all(10),
          color: color,
          child: Column(
            children: [
              const Center(
                child: Text("タイトル"),
              ),
              const Center(
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
