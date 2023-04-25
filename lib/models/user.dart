// ignore_for_file: unused_local_variable, equal_keys_in_map

import 'package:cloud_firestore/cloud_firestore.dart';

class Users {
  final String email;
  final String uid;
  final String photoUrl;
  final String username;
  final String phone;

  Users({
    required this.email,
    required this.phone,
    required this.photoUrl,
    required this.uid,
    required this.username,
  });
  Map<String, dynamic> toJson() => {
        "username": username,
        "uid": uid,
        "photoUrl": photoUrl,
        "phone": phone,
        "email": email,
      };

  static Users fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return Users(
      email: snapshot['email'],
      phone: snapshot['phone'],
      photoUrl: snapshot['photoUrl'],
      uid: snapshot['uid'],
      username: snapshot['username'],
    );
  }
}
