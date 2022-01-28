import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_sample2/screen/memo_grid_screen.dart';

class MemoList extends ConsumerWidget {
  const MemoList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // リストの表示データ（タイトル）
    var listTitle = [
      Text("プライベート"),
      Text("アプリ開発"),
      Text("野球の大会"),
      Text("サッカーの大会"),
    ];

    // リストの表示データ（サブタイトル）
    var listSubTitle = [
      Text(""),
      Text("アイデア"),
      Text("日程"),
      Text("合宿"),
    ];

    // リストに表示するアイコンリスト
    var iconList = [
      Icon(Icons.lock),
      Icon(Icons.phone_iphone),
      Icon(Icons.sports_baseball),
      Icon(Icons.sports_soccer),
    ];

    return Container(
      child: ListView.separated(
          itemBuilder: (BuildContext context, int index) {
            if (index < listTitle.length) {
              return _memoList(context, iconList[index], listTitle[index],
                  listSubTitle[index]);
            } else {
              return _memoAddList(context);
            }
          },
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(height: 10);
          },
          itemCount: listTitle.length + 1),
    );
  }

  // ListViewのセル
  _memoList(BuildContext context, Icon icon, Text title, Text subTitle) {
    return ListTile(
      leading: icon,
      title: title,
      subtitle: subTitle,
      trailing: const Icon(Icons.arrow_forward_ios_sharp),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MemoPage(),
            fullscreenDialog: true,
          ),
        );
      },
    );
  }

  // 追加行リストのセル
  _memoAddList(BuildContext context) {
    final textTitleController = TextEditingController();
    final textDetailController = TextEditingController();

    return ListTile(
      leading: const Icon(Icons.add),
      title: const Text("新規グループを追加"),
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text("グループを追加"),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    decoration: (const InputDecoration(
                      hintText: ("メモのグループ名"),
                    )),
                    controller: textTitleController,
                    onChanged: (text) {},
                  ),
                  const SizedBox(height: 30),
                  TextField(
                    decoration: (const InputDecoration(
                      hintText: ("詳細"),
                    )),
                    controller: textDetailController,
                    onChanged: (text) {},
                  ),
                  const SizedBox(height: 30),
                  TextField(
                    decoration: (const InputDecoration(
                      hintText: ("アイコンを選択"),
                    )),
                    onTap: () {},
                    onChanged: (text) {},
                  )
                ],
              ),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("キャンセル"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("OK"),
                ),
              ],
            );
          },
        );
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => MemoSettingScreen(),
        //     fullscreenDialog: true,
        //   ),
        // );
        // showModalBottomSheet<void>(
        //   context: context,
        //   builder: (BuildContext context) {
        //     return Container(
        //       height: 400,
        //       child: Center(
        //         child: Column(
        //           mainAxisAlignment: MainAxisAlignment.center,
        //           mainAxisSize: MainAxisSize.min,
        //           children: [
        //             const Text('Modal BottomSheet'),
        //             TextField(),
        //             ElevatedButton(
        //               child: const Text('Close BottomSheet'),
        //               onPressed: () => Navigator.pop(context),
        //             )
        //           ],
        //         ),
        //       ),
        //     );
        //   },
        // );
      },
    );
  }
}
