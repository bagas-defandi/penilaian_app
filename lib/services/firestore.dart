import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final CollectionReference lombas =
      FirebaseFirestore.instance.collection("lombas");

  Future<void> addLomba(Map<String, dynamic> lombaMap) {
    return lombas.add(lombaMap);
  }

  Stream<QuerySnapshot> getLombasStream() {
    return lombas.snapshots();
  }
}
