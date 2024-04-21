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

  Future<QueryDocumentSnapshot> getUserInfo(String uid) async {
    final snapshot = await users.where("uid", isEqualTo: uid).get();
    return snapshot.docs.first;
  }

  Future<Map<String, String>> getJuriAndDocID() async {
    final snapshot = await users.where("role", isEqualTo: "juri").get();
    List<String> nama =
        snapshot.docs.map((doc) => doc['nama'] as String).toList();
    List<String> docId = snapshot.docs.map((doc) => doc.id).toList();

    final Map<String, String> juriAndDocId = Map.fromIterables(nama, docId);
    return juriAndDocId;
  }
}
