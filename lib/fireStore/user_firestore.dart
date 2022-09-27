import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class UserFireStore {
  static FirebaseFirestore _firebaseFirestoreInstance = FirebaseFirestore.instance;
  static final _userCollection = _firebaseFirestoreInstance.collection('User');


  /// UserData送信
  static Future<String?> cleateUser() async {
    try {
      final newDoc = await _userCollection.add({
  'name': 'ななし',
  'image_path': 'https://assets.st-note.com/production/uploads/images/58075596/profile_7d12166cbb91dd3ff25bbed3898bdd76.png?width=104&height=104&dpr=2&crop=1:1,smart'
});
      return newDoc.id;
    } catch(err) {
      /// デバッグ時のみ
      if (kDebugMode) {
        print('$err');
        return null;
      }
    }
  }
/// UserData取得
static Future<List<QueryDocumentSnapshot>?> fetchUserData() async {
    try {
final snapShot = await _userCollection.get();
snapShot.docs.forEach((doc) {
  print("${doc.id} ---- ${doc.data()["name"]}");
});
return snapShot.docs;
    } catch(err) {
      /// デバッグ時のみ
      if (kDebugMode) {
        print('$err');
      }
      return null;
    }
}
}

