import 'package:cloud_firestore/cloud_firestore.dart';

class HomeService {
  final CollectionReference _categorycollectionRef =
      FirebaseFirestore.instance.collection('Categories');

  final CollectionReference _productcollectionRef =
      FirebaseFirestore.instance.collection('Products');

  Future<List<QueryDocumentSnapshot>> getCategory() async {
    var value = await _categorycollectionRef.get();
    return value.docs;
  }

  Future<List<QueryDocumentSnapshot>> getBestSelling() async {
    var value = await _productcollectionRef.get();
    return value.docs;
  }
}
