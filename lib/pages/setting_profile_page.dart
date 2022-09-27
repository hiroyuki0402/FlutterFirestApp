import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Settingpage extends StatefulWidget {
  const Settingpage({Key? key}) : super(key: key);

  @override
  State<Settingpage> createState() => _SettingpageState();
}

class _SettingpageState extends State<Settingpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("設定"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              children: const [
                SizedBox(width: 150, child: Text("名前")),
                Expanded(child: TextField())
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              children:  [
                SizedBox(width: 150, child: Text("プロフィール画像")),
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    child: ElevatedButton(onPressed: () {

                    }, child: Text("プロフィール画像を選択")),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 150,
            ),
            SizedBox(
              width: 200,
              height: 50,
              child: ElevatedButton(onPressed: () {

              }, child: Text("完了")),
            )
          ],
        ),
      ),
    );
  }
}
