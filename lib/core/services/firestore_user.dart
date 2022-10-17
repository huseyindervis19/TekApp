import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tek_app/model/user_model.dart';

class FirestoreUser {
  final CollectionReference _userCollectionRef =
      FirebaseFirestore.instance.collection('Users');

  Future<void> addUserToFirestore(UserModel userModel) async {
    return await _userCollectionRef
        .doc(userModel.userId)
        .set(userModel.toJson());
  }
}
