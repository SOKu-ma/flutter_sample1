import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_sample2/model/memo_type_list_model.dart';

class GroupSettings extends ConsumerWidget {
  const GroupSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _textTitleController = TextEditingController();
    final _textDetailController = TextEditingController();

    final _isShareToggle = ref.watch(isShareToggleProvider);
    final _isShareToggleNotifier = ref.watch(isShareToggleProvider.notifier);

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: const EdgeInsets.only(left: 20, right: 30, bottom: 10),
            child: TextField(
              decoration: (const InputDecoration(
                hintText: ("メモのグループ名"),
                labelStyle: TextStyle(fontSize: 8),
                icon: Icon(Icons.note_alt_outlined),
              )),
              controller: _textTitleController,
              onChanged: (text) {},
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 20, right: 30, bottom: 10),
            child: TextField(
              decoration: (const InputDecoration(
                hintText: ("詳細"),
                icon: Icon(Icons.short_text),
              )),
              controller: _textDetailController,
              onChanged: (text) {},
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.only(left: 50),
            child: SwitchListTile(
              title: const Text("共有する"),
              value: _isShareToggle,
              onChanged: (bool val) {
                _isShareToggleNotifier.toggle(val);
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.only(left: 50),
            child: Center(
              child: Row(
                children: [
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text("キャンセル")),
                  const SizedBox(width: 70),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("OK"),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
