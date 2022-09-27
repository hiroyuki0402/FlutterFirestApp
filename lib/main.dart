import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sample2/fireStore/room_firestore.dart';
import 'package:sample2/fireStore/user_firestore.dart';
import 'package:sample2/pages/top_page.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final uid = await UserFireStore.cleateUser();
  if (uid != null) await RoomFireStore.createRoom(uid);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TopPage(),
    );
  }
}