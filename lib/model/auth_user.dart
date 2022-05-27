import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class User extends GetxController {
  String? email;

  User({
    required this.email,
  });

  Map<String, dynamic> toJson() => {"email": email};

  static User fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return User(
      email: snapshot['email'],
    );
  }
}
