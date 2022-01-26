import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_sample2/component/memo_type_grid.dart';
import 'package:flutter_sample2/screen/home_screen.dart';
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
            return _memoList(context, iconList[index], listTitle[index],
                listSubTitle[index]);
          },
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(height: 10);
          },
          itemCount: listTitle.length),
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
            // fullscreenDialog: true,
          ),
        );
      },
    );
  }
}
