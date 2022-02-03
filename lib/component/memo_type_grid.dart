import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

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
                    margin: EdgeInsets.only(left: 10, top: 5),
                    height: 20,
                    width: 20,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black,
                    ),
                    child: Center(
                      child: const Text(
                        "S",
                        style: (TextStyle(color: Colors.white)),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 15),
                    child: Text(
                      "2022/02/02 18:00",
                      style: TextStyle(fontSize: 10),
                    ),
                  ),
                ],
              ),
              Container(
                // color: Colors.red,
                margin: const EdgeInsets.only(left: 10, right: 10),
                child: const Text(
                  "タイトル",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              const SizedBox(height: 5),
              Container(
                // color: Colors.yellow,
                margin: const EdgeInsets.only(left: 10, right: 10),
                child: const Text(
                  "コンテンツ",
                  style: TextStyle(fontSize: 14),
                ),
              ),
              const SizedBox(height: 5),
              Container(
                // color: Colors.blue,
                margin: const EdgeInsets.only(left: 10, right: 10),
                child: Text(
                  text,
                  style: const TextStyle(fontSize: 14),
                ),
              ),
              // Container(
              //   margin: EdgeInsets.only(left: 10),
              //   child: Text(
              //     "2022/02/02 18:00",
              //     style: TextStyle(fontSize: 12),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
