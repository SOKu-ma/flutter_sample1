import 'package:flutter/material.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            _drawerAccount(),
            const SizedBox(height: 40),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 10),
              child: const Text("基本設定"),
            ),
            _drawerRow("アプリカラー", const Icon(Icons.color_lens)),
            const SizedBox(height: 40),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 10),
              child: const Text("その他"),
            ),
            _drawerRow("レビューする", const Icon(Icons.reviews)),
          ],
        ),
      ),
    );
  }

  // アカウント情報
  Widget _drawerAccount() {
    return GestureDetector(
      child: Container(
        margin: const EdgeInsets.only(left: 10, right: 10),
        child: const ListTile(
          leading: Icon(Icons.account_circle),
          title: Text("ユーザー（ゲスト）"),
        ),
      ),
      onTap: () {},
    );
  }

  // アカウント情報以外
  Widget _drawerRow(String title, Icon icon) {
    return Container(
      // margin: const EdgeInsets.only(left: 30, right: 30),
      // decoration: const BoxDecoration(
      // border: Border(
      // bottom: BorderSide(color: Colors.grey),
      // ),
      // ),
      padding: const EdgeInsets.only(
        left: 10,
        right: 10,
      ),
      child: ListTile(
        leading: icon,
        title: Text(title),
        onTap: () {},
      ),
    );
  }
}
