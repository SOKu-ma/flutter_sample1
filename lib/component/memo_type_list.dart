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
        showModalBottomSheet<void>(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
          ),
          barrierColor: Colors.black.withAlpha(1),
          backgroundColor: Colors.white,
          constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height * 0.95),
          isDismissible: true,
          isScrollControlled: true,
          context: context,
          builder: (BuildContext context) {
            return GroupSettings();
            // return Container(
            //   color: Colors.white,
            //   margin: const EdgeInsets.only(top: 70),
            //   // decoration: (BoxDecoration(
            //   //   //角丸にする
            //   //   borderRadius: BorderRadius.only(
            //   //     topLeft: Radius.circular(20),
            //   //     topRight: Radius.circular(20),
            //   //   ),
            //   // )),
            //   child: Center(
            //     child: Column(
            //       mainAxisAlignment: MainAxisAlignment.start,
            //       children: [
            //         // Container(
            //         //   margin: const EdgeInsets.only(top: 20, bottom: 10),
            //         //   padding: const EdgeInsets.only(left: 20, right: 20),
            //         //   child: TextField(
            //         //     controller: _textEditTitleController,
            //         //     decoration: const InputDecoration(hintText: "タイトル"),
            //         //   ),
            //         // ),
            //         // Container(
            //         //   margin: const EdgeInsets.only(top: 20, bottom: 10),
            //         //   padding: const EdgeInsets.only(left: 20, right: 20),
            //         //   child: _keyboardActions(),
            //         // ),
            //         // Container(
            //         //   margin: const EdgeInsets.only(
            //         //       left: 10, right: 10, top: 10, bottom: 10),
            //         //   child: ListTile(
            //         //     title: Text("期限"),
            //         //     trailing: Text("2022/02/02"),
            //         //     onTap: () {
            //         //       print("DatePickerを表示");
            //         //     },
            //         //   ),
            //         // ),
            //         // Container(
            //         //   margin: const EdgeInsets.only(
            //         //       left: 10, right: 10, top: 10, bottom: 10),
            //         //   child: ListTile(
            //         //     title: const Text("メモの色"),
            //         //     onTap: () {
            //         //       print("カラーピッカーを表示");
            //         //     },
            //         //     trailing: Container(
            //         //       margin: const EdgeInsets.only(
            //         //           left: 10, top: 5, right: 20),
            //         //       height: 30,
            //         //       width: 30,
            //         //       decoration: const BoxDecoration(
            //         //           shape: BoxShape.circle, color: Colors.black),
            //         //     ),
            //         //   ),
            //         // ),
            //         // Container(
            //         //   height: 50,
            //         //   width: double.infinity,
            //         //   margin: const EdgeInsets.only(
            //         //       left: 10, right: 10, top: 20),
            //         //   child: ElevatedButton(
            //         //     style: ElevatedButton.styleFrom(
            //         //       textStyle: const TextStyle(fontSize: 24),
            //         //     ),
            //         //     child: const Text('保存'),
            //         //     onPressed: () => Navigator.pop(context),
            //         //   ),
            //         // )
            //       ],
            //     ),
            //   ),
            // );
          },
        );

        // Navigator.push(
        //     context, MaterialPageRoute(builder: (context) => GroupSettings()));
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
