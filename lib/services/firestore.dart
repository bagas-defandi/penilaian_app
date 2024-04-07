import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:penilaian_app/models/user_model.dart';

class FirestoreService {
  final CollectionReference lombas =
      FirebaseFirestore.instance.collection("lombas");
  final CollectionReference users =
      FirebaseFirestore.instance.collection("users");

  Future<void> addLomba(Map<String, dynamic> lombaMap) {
    return lombas.add(lombaMap);
  }

  Stream<QuerySnapshot> getLombasStream() {
    return lombas.snapshots();
  }

  Future<void> addJuri(UserModel userModel) {
    return users.add(userModel.toJson());
  }
}
