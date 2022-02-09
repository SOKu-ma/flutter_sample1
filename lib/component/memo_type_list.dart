import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_sample2/ui/group_settings/group_settings_screen.dart';
import 'package:flutter_sample2/ui/memo_grid/memo_grid_screen.dart';

class MemoList extends ConsumerWidget {
  const MemoList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // リストの表示データ（タイトル）
    var listTitle = [
      Text("プライベート"),
      Text("アプリ開発"),
      Text("野球の大会"),
      Text("サッカーの大会")
    ];

    // リストの表示データ（サブタイトル）
    var listSubTitle = [Text("あああ"), Text("アイデア"), Text("日程"), Text("合宿")];

    return ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          if (index < listTitle.length) {
            return _memoList(context, listTitle[index], listSubTitle[index]);
          } else {
            return _memoAddList(context, ref);
          }
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(height: 10);
        },
        itemCount: listTitle.length + 1);
  }

  // ListViewのセル
  _memoList(BuildContext context, Text title, Text subTitle) {
    return ListTile(
      // leading: icon,
      title: title,
      subtitle: subTitle,
      trailing: const Icon(Icons.arrow_forward_ios),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MemoPage()),
        );
      },
    );
  }

  // 追加行リストのセル
  _memoAddList(BuildContext context, WidgetRef ref) {
    // final _textTitleController = TextEditingController();
    // final _textDetailController = TextEditingController();
    // final _isShareToggle = ref.watch(isShareToggleProvider);
    // final _isShareToggleNotifier = ref.watch(isShareToggleProvider.notifier);

    return ListTile(
      leading: const Icon(Icons.add),
      title: const Text("新規グループを追加"),
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => GroupSettings()));
        // showDialog(
        //   context: context,
        //   builder: (BuildContext context) {
        //     return StatefulBuilder(
        //       builder: (context, setState) {
        //         return AlertDialog(
        //           content: Column(
        //             mainAxisSize: MainAxisSize.min,
        //             children: [
        //               TextField(
        //                 decoration: (const InputDecoration(
        //                   hintText: ("メモのグループ名"),
        //                   labelStyle: TextStyle(fontSize: 8),
        //                   icon: Icon(Icons.note_alt_outlined),
        //                 )),
        //                 controller: _textTitleController,
        //                 onChanged: (text) {},
        //               ),
        //               TextField(
        //                 decoration: (const InputDecoration(
        //                   hintText: ("詳細"),
        //                   icon: Icon(Icons.short_text),
        //                 )),
        //                 controller: _textDetailController,
        //                 onChanged: (text) {},
        //               ),
        //               SwitchListTile(
        //                 title: const Text("共有する"),
        //                 value: _isShareToggle,
        //                 onChanged: (bool val) {
        //                   setState() {
        //                     _isShareToggleNotifier.toggle(val);
        //                   }
        //                 },
        //               ),
        //             ],
        //           ),
        //           actions: [
        //             ElevatedButton(
        //               onPressed: () {
        //                 Navigator.pop(context);
        //               },
        //               child: const Text("キャンセル"),
        //             ),
        //             ElevatedButton(
        //               onPressed: () {
        //                 Navigator.pop(context);
        //               },
        //               child: const Text("OK"),
        //             ),
        //           ],
        //         );
        //       },
        //     );
        //   },
        // );
      },
    );
  }
}
