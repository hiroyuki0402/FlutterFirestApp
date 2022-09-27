import 'package:flutter/material.dart';
import 'package:sample2/pages/setting_profile_page.dart';
import 'package:sample2/pages/talk_room_page.dart';
import '../model/user.dart';

class TopPage extends StatefulWidget {
  const TopPage({Key? key}) : super(key: key);

  @override
  State<TopPage> createState() => _TopPageState();
}

class _TopPageState extends State<TopPage> {
  List<User> userList = [
    User(
        name: '白石',
        uid: 'abc',
        imagePath:
            'https://assets.st-note.com/production/uploads/images/58075596/profile_7d12166cbb91dd3ff25bbed3898bdd76.png?width=104&height=104&dpr=2&crop=1:1,smart',
        lastMessage: 'こんにちは'),
    User(
        name: "黒石",
        uid: "abc",
        imagePath:
            "https://assets.st-note.com/production/uploads/images/58075596/profile_7d12166cbb91dd3ff25bbed3898bdd76.png?width=104&height=104&dpr=2&crop=1:1,smart",
        lastMessage: "こんにちは"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("top_page"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Settingpage()));
              },
              icon: const Icon(Icons.settings))
        ],
      ),

      /// Swiftで言うtableView
      body: ListView.builder(

          /// セルのカウント
          itemCount: userList.length,
          itemBuilder: (context, index) {
            /// InkWell -> 普段押せないものが押せるようにする
            return InkWell(
              onTap: () {
                /// 画面遷移
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            TalkRoomPage(userList[index].name)));
              },
              child: SizedBox(
                height: 70,
                child: Row(
                  children: [
                    /// 画像を丸く表示させる
                    Padding(
                      /// 左右に同じマージン配置
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: CircleAvatar(
                        /// 画像をのサイズ変更
                        radius: 20,

                        /// アイコンの設定
                        backgroundImage: userList[index].imagePath != null
                            ? NetworkImage(userList[index].imagePath!)
                            : null,
                      ),
                    ),
                    Column(
                      /// 左よせ
                      crossAxisAlignment: CrossAxisAlignment.start,

                      /// センターに配置
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(userList[index].name),
                        Text(userList[0].lastMessage),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
