import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

  final firestore = Firestore.instance;
  FirebaseUser loggedInUser;
final auth = FirebaseAuth.instance;

void gerCurrentUser() async {
  try {
    final user = await auth.currentUser();
    if (user != null) {
      loggedInUser = user;
//        print(loggedInUser.email);
    }
  } catch (e) {
    print(e);
  }

}

//class UserInfo{
//  String email;
//  String userId;String name;String password;
//
//  UserInfo({this.email, this.userId, this.name, this.password});
//
//  final auth = FirebaseAuth.instance;
//  List<UserInfo> _usersInfo =[];
//  List<UserInfo> get usersInfo{
//    return _usersInfo;
//  }
//  void gerCurrentUser() async {
//    try {
//      final user = await auth.currentUser();
//      if (user != null) {
//        loggedInUser = user;
//        userId = loggedInUser.uid;
////        print(loggedInUser.email);
//      }
//    } catch (e) {
//      print(e);
//    }
//
//  }
//
////  Map<String ,dynamic> user12 ;
//
//Future<void>  getUsersInfo()async {
//    QuerySnapshot doc = await firestore.collection('users').getDocuments();
//    doc.documents.forEach((result){
////      print(result.data['email']);
////      print(result.data['user-name']);
////      print(result.data['password']);
////      print(result.data['user-id']);
//      _usersInfo.add(UserInfo(
//        email: result.data['email'],
//        name: result.data['user-name'],
//        password: result.data['password'],
//        userId: result.data['user-id'],
//      ));
//    });
//
//  }
//
//}
