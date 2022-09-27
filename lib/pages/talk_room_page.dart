import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;

import '../model/message.dart';

class TalkRoomPage extends StatefulWidget {
  final String name;

  const TalkRoomPage(this.name, {Key? key}) : super(key: key);

  @override
  State<TalkRoomPage> createState() => _TalkRoomPageState();
}

class _TalkRoomPageState extends State<TalkRoomPage> {
  List<Messega> messages = [
    Messega(
        messega:
            "messegamessegamessegamessegamessegamessegamessegamessegamessegamessegamessegamessega",
        isMe: true,
        sendTime: DateTime(2022, 1, 1, 12, 0)),
    Messega(
        messega: "messega2",
        isMe: false,
        sendTime: DateTime(2022, 1, 1, 12, 1)),
    Messega(
        messega: "messega3", isMe: true, sendTime: DateTime(2022, 1, 1, 12, 2)),
    Messega(
        messega:
            "messegamessegamessegamessegamessegamessegamessegamessegamessegamessegamessegamessega",
        isMe: true,
        sendTime: DateTime(2022, 1, 1, 12, 0)),
    Messega(
        messega: "messega2",
        isMe: false,
        sendTime: DateTime(2022, 1, 1, 12, 1)),
    Messega(
        messega: "messega3", isMe: true, sendTime: DateTime(2022, 1, 1, 12, 2)),
    Messega(
        messega:
            "messegamessegamessegamessegamessegamessegamessegamessegamessegamessegamessegamessega",
        isMe: true,
        sendTime: DateTime(2022, 1, 1, 12, 0)),
    Messega(
        messega: "messega2",
        isMe: false,
        sendTime: DateTime(2022, 1, 1, 12, 1)),
    Messega(
        messega: "messega3", isMe: true, sendTime: DateTime(2022, 1, 1, 12, 2)),
    Messega(
        messega:
            "messegamessegamessegamessegamessegamessegamessegamessegamessegamessegamessegamessega",
        isMe: true,
        sendTime: DateTime(2022, 1, 1, 12, 0)),
    Messega(
        messega: "messega2",
        isMe: false,
        sendTime: DateTime(2022, 1, 1, 12, 1)),
    Messega(
        messega: "messega3", isMe: true, sendTime: DateTime(2022, 1, 1, 12, 2)),
    Messega(
        messega:
            "messegamessegamessegamessegamessegamessegamessegamessegamessegamessegamessegamessega",
        isMe: true,
        sendTime: DateTime(2022, 1, 1, 12, 0)),
    Messega(
        messega: "messega2",
        isMe: false,
        sendTime: DateTime(2022, 1, 1, 12, 1)),
    Messega(
        messega: "messega3", isMe: true, sendTime: DateTime(2022, 1, 1, 12, 2)),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen,
      appBar: AppBar(
        title: Text(widget.name),
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 60),
            child: ListView.builder(

                /// Viewを可変にする
                physics: const RangeMaintainingScrollPhysics(),

                /// 数が少ない場合は上から始める
                shrinkWrap: true,

                /// reverse = 下から始まる
                reverse: true,
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(
                        top: 10,
                        left: 10,
                        right: 10,
                        bottom: index == 0 ? 10 : 0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      textDirection: messages[index].isMe
                          ? TextDirection.rtl
                          : TextDirection.ltr,
                      children: [
                        Container(
                            constraints: BoxConstraints(
                                maxWidth:
                                    MediaQuery.of(context).size.width * 0.6),
                            decoration: BoxDecoration(
                              color: messages[index].isMe
                                  ? Colors.green
                                  : Colors.white,

                              /// 角丸
                              borderRadius: BorderRadius.circular(15),
                            ),
                            padding: const EdgeInsets.symmetric(
                                vertical: 6, horizontal: 10),
                            child: Text(messages[index].messega)),
                        Text(intl.DateFormat('HH:mm')
                            .format(messages[index].sendTime)),
                      ],
                    ),
                  );
                }),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                color: Colors.white,
                height: 60,
                child: Row(
                  children: [
                    const Expanded(
                        child: Padding(
                          padding:  EdgeInsets.all(10.0),
                          child: TextField(
                      decoration: InputDecoration(
                        contentPadding:  EdgeInsets.only(left: 8),
                          border: OutlineInputBorder()),
                    ),
                        )),
                    IconButton(onPressed: () {}, icon: Icon(Icons.send))
                  ],
                ),
              ),
              Container(
                color: Colors.white,
                height: MediaQuery.of(context).padding.bottom,
              ),
            ],
          )
        ],
      ),
    );
  }
}
