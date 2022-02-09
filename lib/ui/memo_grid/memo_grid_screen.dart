import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_sample2/component/memo_type_grid.dart';
import 'package:keyboard_actions/keyboard_actions.dart';

class MemoPage extends ConsumerWidget {
  MemoPage({Key? key}) : super(key: key);

  var grid = ["memo1", "memo2", "memo3"];
  var gridColor = [
    Colors.lime,
    Colors.orangeAccent,
    Colors.lightBlueAccent,
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(),
      body: TabMenuController(),
    );
  }
}

class TabMenuController extends StatelessWidget {
  final _tab = <Tab>[
    const Tab(text: 'Memo1'),
    const Tab(text: 'Memo2'),
    const Tab(text: 'Memo3'),
  ];

  final _textEditTitleController = TextEditingController();
  final _textEditContentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _tab.length,
      initialIndex: 0,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: AppBar(
            bottom: TabBar(
              tabs: _tab,
              isScrollable: true,
              indicatorSize: TabBarIndicatorSize.tab,
            ),
          ),
        ),
        body: TabBarView(
          children: [for (int i = 0; i < 3; i++) MemoGrid()],
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            showModalBottomSheet<void>(
              isDismissible: true,
              backgroundColor: Colors.transparent,
              isScrollControlled: true,
              context: context,
              builder: (BuildContext context) {
                return Container(
                  color: Colors.white,
                  margin: const EdgeInsets.only(top: 70),
                  // decoration: (BoxDecoration(
                  //   //角丸にする
                  //   borderRadius: BorderRadius.only(
                  //     topLeft: Radius.circular(20),
                  //     topRight: Radius.circular(20),
                  //   ),
                  // )),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 20, bottom: 10),
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: TextField(
                            controller: _textEditTitleController,
                            decoration: const InputDecoration(hintText: "タイトル"),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 20, bottom: 10),
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: _keyboardActions(),
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                              left: 10, right: 10, top: 10, bottom: 10),
                          child: ListTile(
                            title: Text("期限"),
                            trailing: Text("2022/02/02"),
                            onTap: () {
                              print("DatePickerを表示");
                            },
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                              left: 10, right: 10, top: 10, bottom: 10),
                          child: ListTile(
                            title: const Text("メモの色"),
                            onTap: () {
                              print("カラーピッカーを表示");
                            },
                            trailing: Container(
                              margin: const EdgeInsets.only(
                                  left: 10, top: 5, right: 20),
                              height: 30,
                              width: 30,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle, color: Colors.black),
                            ),
                          ),
                        ),
                        Container(
                          height: 50,
                          width: double.infinity,
                          margin: const EdgeInsets.only(
                              left: 10, right: 10, top: 20),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              textStyle: const TextStyle(fontSize: 24),
                            ),
                            child: const Text('保存'),
                            onPressed: () => Navigator.pop(context),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }

  final FocusNode _textNode1 = FocusNode();

  _keyboardActions() {
    return KeyboardActions(
      isDialog: true,
      autoScroll: false,
      config: _keyboardActionConfig(),
      child: TextField(
        controller: _textEditContentController,
        decoration: const InputDecoration(hintText: "メモの詳細"),
        focusNode: _textNode1,
        keyboardType: TextInputType.multiline,
        maxLines: null,
      ),
    );
  }

  _keyboardActionConfig() {
    return KeyboardActionsConfig(
      keyboardActionsPlatform: KeyboardActionsPlatform.ALL,
      nextFocus: true,
      actions: [
        KeyboardActionsItem(
            focusNode: _textNode1, toolbarButtons: []),
      ],
    );
  }
}
