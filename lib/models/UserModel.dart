import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? uid;
  bool? isVerified;
  final String? email;
  String? password;
  final String? userName;
  final int? age;
  UserModel({this.uid, this.email, this.password, this.userName, this.age,this.isVerified});

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'displayName': userName,
      'age': age,
    };
  }

  UserModel.fromDocumentSnapshot(DocumentSnapshot<Map<String, dynamic>> doc)
      : uid = doc.id,
        email = doc.data()!["email"],
        age = doc.data()!["age"],
        userName = doc.data()!["displayName"];


  UserModel copyWith({
    bool? isVerified,
    String? uid,
    String? email,
    String? password,
    String? userName,
    int? age,
  }) {
    return UserModel(
        uid: uid ?? this.uid,
        email: email ?? this.email,
        password: password ?? this.password,
        userName: userName ?? this.userName,
        age: age ?? this.age,
        isVerified: isVerified ?? this.isVerified
    );
  }
}