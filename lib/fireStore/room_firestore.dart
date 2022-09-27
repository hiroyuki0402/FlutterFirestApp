import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sample2/fireStore/user_firestore.dart';

class RoomFireStore {
  static FirebaseFirestore _firebaseFirestoreInstance = FirebaseFirestore.instance;
  static final _roomCollection = _firebaseFirestoreInstance.collection('Room');

  static Future<void> createRoom(String uid) async {
final docs = await UserFireStore.fetchUserData();
if (docs == null) return;
    docs.forEach((doc) async {
      if (doc.id == uid) return;
      await _roomCollection.add({
        'joind_user_id': [doc.id, uid],
        'createTime': Timestamp.now()
      });
});
  }
}